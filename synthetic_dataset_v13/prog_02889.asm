; DESCRIPTION: Composite: Renders a yellow line between points (127, 85) and (435, 162) then Places a red dot at position (130, 124) then Creates a orange rectangular region at (289, 30) spanning 90 by 30 pixels.
; PLAN: r0=127(x1), r1=85(y1), r2=435(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=124(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=289(x), r11=30(y), r12=90(width), r13=30(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 85
LDI r2, 435
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 124
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 289
LDI r11, 30
LDI r12, 90
LDI r13, 30
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
