; DESCRIPTION: Draws a white line from (146, 112) to (132, 219).
; PLAN: r0=146(x1), r1=112(y1), r2=132(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 112
LDI r2, 132
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
