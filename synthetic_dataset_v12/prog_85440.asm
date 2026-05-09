; DESCRIPTION: Composite: Renders a cyan box of size 78x80 starting at (330, 106) then Sets a single green pixel at (375, 239).
; PLAN: r0=330(x), r1=106(y), r2=78(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x), r6=239(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 330
LDI r1, 106
LDI r2, 78
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 239
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
