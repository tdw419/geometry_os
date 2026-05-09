; DESCRIPTION: Composite: Places a yellow line segment connecting (176, 89) to (498, 110) then Places a cyan 60x16 rectangle at position (373, 52).
; PLAN: r0=176(x1), r1=89(y1), r2=498(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=52(y), r7=60(width), r8=16(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 89
LDI r2, 498
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 52
LDI r7, 60
LDI r8, 16
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
