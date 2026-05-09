; DESCRIPTION: Draws a black line from (332, 191) to (138, 168).
; PLAN: r0=332(x1), r1=191(y1), r2=138(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 191
LDI r2, 138
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
