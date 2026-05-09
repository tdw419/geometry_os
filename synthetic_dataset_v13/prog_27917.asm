; DESCRIPTION: Renders a black line between points (291, 214) and (436, 236).
; PLAN: r0=291(x1), r1=214(y1), r2=436(x2), r3=236(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 214
LDI r2, 436
LDI r3, 236
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
