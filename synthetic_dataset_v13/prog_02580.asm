; DESCRIPTION: Composite: Sets a single green pixel at (25, 191) then Renders a orange box of size 94x35 starting at (256, 199).
; PLAN: r0=25(x), r1=191(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=256(x), r6=199(y), r7=94(width), r8=35(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 191
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 256
LDI r6, 199
LDI r7, 94
LDI r8, 35
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
