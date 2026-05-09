; DESCRIPTION: Draws a magenta line from (128, 32) to (309, 172).
; PLAN: r0=128(x1), r1=32(y1), r2=309(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 32
LDI r2, 309
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
