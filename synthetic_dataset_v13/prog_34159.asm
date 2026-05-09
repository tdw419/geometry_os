; DESCRIPTION: Composite: Sets a single green pixel at (359, 249) then Renders a white box of size 102x119 starting at (127, 20).
; PLAN: r0=359(x), r1=249(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=20(y), r7=102(width), r8=119(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 249
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 127
LDI r6, 20
LDI r7, 102
LDI r8, 119
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
