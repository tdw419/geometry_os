; DESCRIPTION: Draws a black line from (19, 95) to (271, 63).
; PLAN: r0=19(x1), r1=95(y1), r2=271(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 95
LDI r2, 271
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
