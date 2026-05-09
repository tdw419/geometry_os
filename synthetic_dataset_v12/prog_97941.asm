; DESCRIPTION: Composite: Places a magenta 118x36 rectangle at position (15, 42) then Places a black line segment connecting (427, 237) to (326, 223).
; PLAN: r0=15(x), r1=42(y), r2=118(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=427(x1), r6=237(y1), r7=326(x2), r8=223(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 15
LDI r1, 42
LDI r2, 118
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 237
LDI r7, 326
LDI r8, 223
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
