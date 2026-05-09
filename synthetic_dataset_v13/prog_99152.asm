; DESCRIPTION: Composite: Places a cyan line segment connecting (323, 11) to (412, 64) then Places a red 18x66 rectangle at position (204, 31) then Places a blue dot at position (287, 126).
; PLAN: r0=323(x1), r1=11(y1), r2=412(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=31(y), r7=18(width), r8=66(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=287(x), r11=126(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 323
LDI r1, 11
LDI r2, 412
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 31
LDI r7, 18
LDI r8, 66
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 126
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
