; DESCRIPTION: Composite: Places a black 97x82 rectangle at position (237, 22) then Places a cyan line segment connecting (483, 156) to (284, 86).
; PLAN: r0=237(x), r1=22(y), r2=97(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=483(x1), r6=156(y1), r7=284(x2), r8=86(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 237
LDI r1, 22
LDI r2, 97
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 156
LDI r7, 284
LDI r8, 86
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
