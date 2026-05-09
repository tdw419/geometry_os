; DESCRIPTION: Draws a blue line from (359, 196) to (165, 64).
; PLAN: r0=359(x1), r1=196(y1), r2=165(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 196
LDI r2, 165
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
