; DESCRIPTION: Draws a green line from (201, 32) to (193, 74).
; PLAN: r0=201(x1), r1=32(y1), r2=193(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 32
LDI r2, 193
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
