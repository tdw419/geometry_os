; DESCRIPTION: Composite: Renders a blue line between points (140, 64) and (432, 75) then Places a green 63x80 rectangle at position (381, 79).
; PLAN: r0=140(x1), r1=64(y1), r2=432(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=79(y), r7=63(width), r8=80(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 140
LDI r1, 64
LDI r2, 432
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 79
LDI r7, 63
LDI r8, 80
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
