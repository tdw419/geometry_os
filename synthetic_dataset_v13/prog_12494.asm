; DESCRIPTION: Composite: Renders a orange box of size 110x71 starting at (3, 123) then Places a blue circle of radius 79 at center (173, 83).
; PLAN: r0=3(x), r1=123(y), r2=110(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=173(x), r6=83(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 3
LDI r1, 123
LDI r2, 110
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 83
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
