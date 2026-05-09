; DESCRIPTION: Draws a black line from (167, 191) to (254, 172).
; PLAN: r0=167(x1), r1=191(y1), r2=254(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 191
LDI r2, 254
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
