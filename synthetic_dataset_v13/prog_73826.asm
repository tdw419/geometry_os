; DESCRIPTION: Composite: Sets a single green pixel at (329, 149) then Renders a magenta box of size 53x57 starting at (445, 179).
; PLAN: r0=329(x), r1=149(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=445(x), r6=179(y), r7=53(width), r8=57(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 329
LDI r1, 149
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 445
LDI r6, 179
LDI r7, 53
LDI r8, 57
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
