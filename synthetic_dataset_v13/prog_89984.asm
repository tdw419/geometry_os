; DESCRIPTION: Composite: Draws a black line from (308, 103) to (343, 133) then Draws a magenta rectangle at (434, 5) with width 66 and height 64.
; PLAN: r0=308(x1), r1=103(y1), r2=343(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=434(x), r6=5(y), r7=66(width), r8=64(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 103
LDI r2, 343
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 5
LDI r7, 66
LDI r8, 64
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
