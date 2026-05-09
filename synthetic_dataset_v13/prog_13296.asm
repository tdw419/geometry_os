; DESCRIPTION: Composite: Renders a red box of size 108x16 starting at (80, 49) then Renders a black disk with center (140, 37) and radius 13.
; PLAN: r0=80(x), r1=49(y), r2=108(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x), r6=37(y), r7=13(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 80
LDI r1, 49
LDI r2, 108
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 37
LDI r7, 13
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
