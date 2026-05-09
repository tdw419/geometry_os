; DESCRIPTION: Composite: Places a red 60x106 rectangle at position (399, 73) then Places a white dot at position (257, 208) then Draws a cyan line from (429, 101) to (222, 88).
; PLAN: r0=399(x), r1=73(y), r2=60(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x), r6=208(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=429(x1), r11=101(y1), r12=222(x2), r13=88(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 399
LDI r1, 73
LDI r2, 60
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 208
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 429
LDI r11, 101
LDI r12, 222
LDI r13, 88
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
