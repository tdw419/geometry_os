; DESCRIPTION: Composite: Renders a red box of size 16x60 starting at (458, 115) then Draws a cyan circle centered at (234, 97) with radius 71.
; PLAN: r0=458(x), r1=115(y), r2=16(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=97(y), r7=71(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 458
LDI r1, 115
LDI r2, 16
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 97
LDI r7, 71
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
