; DESCRIPTION: Composite: Places a green 32x72 rectangle at position (133, 93) then Places a magenta line segment connecting (429, 185) to (2, 241).
; PLAN: r0=133(x), r1=93(y), r2=32(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=429(x1), r6=185(y1), r7=2(x2), r8=241(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 93
LDI r2, 32
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 185
LDI r7, 2
LDI r8, 241
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
