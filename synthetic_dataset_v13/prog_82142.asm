; DESCRIPTION: Composite: Places a green dot at position (397, 216) then Places a orange 60x36 rectangle at position (361, 10).
; PLAN: r0=397(x), r1=216(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=361(x), r6=10(y), r7=60(width), r8=36(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 397
LDI r1, 216
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 361
LDI r6, 10
LDI r7, 60
LDI r8, 36
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
