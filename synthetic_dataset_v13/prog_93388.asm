; DESCRIPTION: Draws a magenta line from (210, 128) to (252, 206).
; PLAN: r0=210(x1), r1=128(y1), r2=252(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 128
LDI r2, 252
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
