; DESCRIPTION: Composite: Renders a yellow box of size 70x19 starting at (149, 225) then Renders a yellow disk with center (334, 35) and radius 16.
; PLAN: r0=149(x), r1=225(y), r2=70(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=334(x), r6=35(y), r7=16(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 149
LDI r1, 225
LDI r2, 70
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 35
LDI r7, 16
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
