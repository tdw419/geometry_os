; DESCRIPTION: Draws a black line from (239, 191) to (217, 6).
; PLAN: r0=239(x1), r1=191(y1), r2=217(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 191
LDI r2, 217
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
