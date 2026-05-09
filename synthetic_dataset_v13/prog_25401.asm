; DESCRIPTION: Draws a white line from (384, 51) to (14, 33).
; PLAN: r0=384(x1), r1=51(y1), r2=14(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 51
LDI r2, 14
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
