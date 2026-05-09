; DESCRIPTION: Draws a white line from (471, 73) to (218, 238).
; PLAN: r0=471(x1), r1=73(y1), r2=218(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 73
LDI r2, 218
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
