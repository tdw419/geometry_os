; DESCRIPTION: Composite: Renders a purple line between points (420, 248) and (491, 164) then Creates a orange rectangular region at (315, 130) spanning 102 by 52 pixels.
; PLAN: r0=420(x1), r1=248(y1), r2=491(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=130(y), r7=102(width), r8=52(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 248
LDI r2, 491
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 130
LDI r7, 102
LDI r8, 52
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
