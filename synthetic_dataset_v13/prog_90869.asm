; DESCRIPTION: Composite: Renders a yellow box of size 93x40 starting at (153, 11) then Places a cyan circle of radius 70 at center (311, 76).
; PLAN: r0=153(x), r1=11(y), r2=93(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x), r6=76(y), r7=70(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 153
LDI r1, 11
LDI r2, 93
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 76
LDI r7, 70
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
