; DESCRIPTION: Composite: Places a green dot at position (140, 147) then Places a cyan 68x113 rectangle at position (433, 38).
; PLAN: r0=140(x), r1=147(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=433(x), r6=38(y), r7=68(width), r8=113(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 140
LDI r1, 147
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 433
LDI r6, 38
LDI r7, 68
LDI r8, 113
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
