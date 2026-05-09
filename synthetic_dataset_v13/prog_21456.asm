; DESCRIPTION: Composite: Renders a cyan box of size 22x12 starting at (398, 170) then Renders a white disk with center (141, 178) and radius 75.
; PLAN: r0=398(x), r1=170(y), r2=22(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x), r6=178(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 398
LDI r1, 170
LDI r2, 22
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 178
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
