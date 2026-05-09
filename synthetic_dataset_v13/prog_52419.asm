; DESCRIPTION: Places a black line segment connecting (14, 214) to (27, 47).
; PLAN: r0=14(x1), r1=214(y1), r2=27(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 214
LDI r2, 27
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
