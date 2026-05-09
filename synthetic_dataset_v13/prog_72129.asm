; DESCRIPTION: Composite: Sets a single cyan pixel at (156, 187) then Draws a purple line from (85, 249) to (505, 209).
; PLAN: r0=156(x), r1=187(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=85(x1), r6=249(y1), r7=505(x2), r8=209(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 187
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 85
LDI r6, 249
LDI r7, 505
LDI r8, 209
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
