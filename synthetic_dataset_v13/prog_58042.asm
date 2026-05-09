; DESCRIPTION: Composite: Places a green dot at position (308, 224) then Places a cyan line segment connecting (249, 237) to (411, 176).
; PLAN: r0=308(x), r1=224(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=249(x1), r6=237(y1), r7=411(x2), r8=176(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 224
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 249
LDI r6, 237
LDI r7, 411
LDI r8, 176
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
