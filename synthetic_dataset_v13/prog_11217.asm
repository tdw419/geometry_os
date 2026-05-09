; DESCRIPTION: Draws a blue line from (109, 128) to (57, 64).
; PLAN: r0=109(x1), r1=128(y1), r2=57(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 128
LDI r2, 57
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
