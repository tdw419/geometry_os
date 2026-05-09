; DESCRIPTION: Draws a white line from (121, 48) to (471, 14).
; PLAN: r0=121(x1), r1=48(y1), r2=471(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 48
LDI r2, 471
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
