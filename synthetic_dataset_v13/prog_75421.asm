; DESCRIPTION: Composite: Renders a cyan box of size 115x107 starting at (270, 14) then Renders a cyan disk with center (291, 69) and radius 22.
; PLAN: r0=270(x), r1=14(y), r2=115(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x), r6=69(y), r7=22(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 270
LDI r1, 14
LDI r2, 115
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 69
LDI r7, 22
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
