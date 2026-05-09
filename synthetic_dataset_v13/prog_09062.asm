; DESCRIPTION: Composite: Draws a yellow line from (439, 163) to (429, 252) then Places a cyan 114x94 rectangle at position (3, 25).
; PLAN: r0=439(x1), r1=163(y1), r2=429(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=3(x), r6=25(y), r7=114(width), r8=94(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 439
LDI r1, 163
LDI r2, 429
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 25
LDI r7, 114
LDI r8, 94
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
