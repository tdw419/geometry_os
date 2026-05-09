; DESCRIPTION: Places a white line segment connecting (326, 51) to (146, 18).
; PLAN: r0=326(x1), r1=51(y1), r2=146(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 51
LDI r2, 146
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
