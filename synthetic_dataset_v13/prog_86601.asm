; DESCRIPTION: Composite: Renders a magenta line between points (382, 155) and (60, 234) then Places a black dot at position (47, 111) then Places a white circle of radius 50 at center (428, 88).
; PLAN: r0=382(x1), r1=155(y1), r2=60(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=47(x), r6=111(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=428(x), r11=88(y), r12=50(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 382
LDI r1, 155
LDI r2, 60
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 111
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 428
LDI r11, 88
LDI r12, 50
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
