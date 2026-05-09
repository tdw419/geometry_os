; DESCRIPTION: Places a black line segment connecting (305, 45) to (144, 249).
; PLAN: r0=305(x1), r1=45(y1), r2=144(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 45
LDI r2, 144
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
