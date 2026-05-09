; DESCRIPTION: Composite: Places a white dot at position (83, 193) then Renders a green box of size 113x78 starting at (254, 35).
; PLAN: r0=83(x), r1=193(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=35(y), r7=113(width), r8=78(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 193
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 254
LDI r6, 35
LDI r7, 113
LDI r8, 78
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
