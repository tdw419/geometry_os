; DESCRIPTION: Draws a black line from (485, 112) to (24, 64).
; PLAN: r0=485(x1), r1=112(y1), r2=24(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 112
LDI r2, 24
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
