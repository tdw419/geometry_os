; DESCRIPTION: Draws a purple line from (299, 196) to (125, 31).
; PLAN: r0=299(x1), r1=196(y1), r2=125(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 196
LDI r2, 125
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
