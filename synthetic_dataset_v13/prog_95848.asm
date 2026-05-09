; DESCRIPTION: Composite: Places a green dot at position (490, 176) then Renders a cyan box of size 60x32 starting at (438, 218).
; PLAN: r0=490(x), r1=176(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=438(x), r6=218(y), r7=60(width), r8=32(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 490
LDI r1, 176
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 438
LDI r6, 218
LDI r7, 60
LDI r8, 32
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
