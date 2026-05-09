; DESCRIPTION: Composite: Renders a orange box of size 16x62 starting at (411, 96) then Creates a blue circular shape at (395, 188) with radius 64.
; PLAN: r0=411(x), r1=96(y), r2=16(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=395(x), r6=188(y), r7=64(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 411
LDI r1, 96
LDI r2, 16
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 188
LDI r7, 64
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
