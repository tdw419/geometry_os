; DESCRIPTION: Draws a green line from (355, 191) to (10, 239).
; PLAN: r0=355(x1), r1=191(y1), r2=10(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 191
LDI r2, 10
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
