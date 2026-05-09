; DESCRIPTION: Composite: Draws a red line from (382, 183) to (51, 4) then Places a green dot at position (396, 249) then Renders a cyan disk with center (216, 107) and radius 22.
; PLAN: r0=382(x1), r1=183(y1), r2=51(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=249(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=216(x), r11=107(y), r12=22(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 382
LDI r1, 183
LDI r2, 51
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 249
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 216
LDI r11, 107
LDI r12, 22
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
