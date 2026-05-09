; DESCRIPTION: Draws a magenta line from (105, 128) to (324, 33).
; PLAN: r0=105(x1), r1=128(y1), r2=324(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 128
LDI r2, 324
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
