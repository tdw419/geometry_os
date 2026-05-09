; DESCRIPTION: Composite: Draws a purple line from (18, 25) to (111, 146) then Places a orange dot at position (89, 130) then Creates a black rectangular region at (389, 102) spanning 20 by 60 pixels.
; PLAN: r0=18(x1), r1=25(y1), r2=111(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=89(x), r6=130(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=389(x), r11=102(y), r12=20(width), r13=60(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 18
LDI r1, 25
LDI r2, 111
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 130
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 389
LDI r11, 102
LDI r12, 20
LDI r13, 60
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
