; DESCRIPTION: Composite: Renders a blue disk with center (220, 98) and radius 33 then Places a purple dot at position (188, 148) then Draws a cyan line from (452, 242) to (171, 68).
; PLAN: r0=220(x), r1=98(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=188(x), r6=148(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=452(x1), r11=242(y1), r12=171(x2), r13=68(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 98
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 188
LDI r6, 148
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 452
LDI r11, 242
LDI r12, 171
LDI r13, 68
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
