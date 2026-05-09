; DESCRIPTION: Draws a black line from (129, 220) to (178, 219).
; PLAN: r0=129(x1), r1=220(y1), r2=178(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 220
LDI r2, 178
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
