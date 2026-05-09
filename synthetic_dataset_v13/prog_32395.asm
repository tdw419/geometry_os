; DESCRIPTION: Draws a black line from (162, 219) to (48, 141).
; PLAN: r0=162(x1), r1=219(y1), r2=48(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 219
LDI r2, 48
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
