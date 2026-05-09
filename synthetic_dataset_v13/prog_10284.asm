; DESCRIPTION: Composite: Sets a single green pixel at (261, 12) then Renders a blue box of size 77x76 starting at (435, 10).
; PLAN: r0=261(x), r1=12(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=435(x), r6=10(y), r7=77(width), r8=76(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 12
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 435
LDI r6, 10
LDI r7, 77
LDI r8, 76
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
