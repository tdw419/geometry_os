; DESCRIPTION: Draws a black line from (39, 45) to (205, 219).
; PLAN: r0=39(x1), r1=45(y1), r2=205(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 45
LDI r2, 205
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
