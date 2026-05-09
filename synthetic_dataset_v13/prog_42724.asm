; DESCRIPTION: Composite: Places a cyan circle of radius 15 at center (293, 125) then Renders a red box of size 78x60 starting at (393, 96) then Places a orange line segment connecting (388, 84) to (247, 180).
; PLAN: r0=293(x), r1=125(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x), r6=96(y), r7=78(width), r8=60(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=388(x1), r11=84(y1), r12=247(x2), r13=180(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 293
LDI r1, 125
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 96
LDI r7, 78
LDI r8, 60
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 388
LDI r11, 84
LDI r12, 247
LDI r13, 180
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
