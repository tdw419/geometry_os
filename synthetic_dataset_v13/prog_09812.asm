; DESCRIPTION: Composite: Draws a red line from (447, 175) to (56, 131) then Places a magenta dot at position (303, 132) then Renders a white disk with center (176, 175) and radius 46.
; PLAN: r0=447(x1), r1=175(y1), r2=56(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=132(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=176(x), r11=175(y), r12=46(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 447
LDI r1, 175
LDI r2, 56
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 132
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 176
LDI r11, 175
LDI r12, 46
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
