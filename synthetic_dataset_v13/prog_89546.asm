; DESCRIPTION: Composite: Places a green dot at position (491, 133) then Places a cyan 90x89 rectangle at position (166, 144).
; PLAN: r0=491(x), r1=133(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=144(y), r7=90(width), r8=89(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 491
LDI r1, 133
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 166
LDI r6, 144
LDI r7, 90
LDI r8, 89
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
