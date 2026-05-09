; DESCRIPTION: Composite: Sets a single magenta pixel at (457, 22) then Places a yellow 113x15 rectangle at position (326, 142) then Renders a cyan line between points (85, 158) and (116, 159).
; PLAN: r0=457(x), r1=22(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=326(x), r6=142(y), r7=113(width), r8=15(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=85(x1), r11=158(y1), r12=116(x2), r13=159(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 457
LDI r1, 22
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 326
LDI r6, 142
LDI r7, 113
LDI r8, 15
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 158
LDI r12, 116
LDI r13, 159
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
