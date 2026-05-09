; DESCRIPTION: Composite: Renders a orange box of size 28x101 starting at (360, 69) then Renders a cyan disk with center (180, 27) and radius 14.
; PLAN: r0=360(x), r1=69(y), r2=28(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x), r6=27(y), r7=14(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 360
LDI r1, 69
LDI r2, 28
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 27
LDI r7, 14
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
