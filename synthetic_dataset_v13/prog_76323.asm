; DESCRIPTION: Draws a magenta line from (128, 179) to (251, 228).
; PLAN: r0=128(x1), r1=179(y1), r2=251(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 179
LDI r2, 251
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
