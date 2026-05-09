; DESCRIPTION: Draws a black line from (229, 152) to (444, 219).
; PLAN: r0=229(x1), r1=152(y1), r2=444(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 152
LDI r2, 444
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
