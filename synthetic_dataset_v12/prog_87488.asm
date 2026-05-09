; DESCRIPTION: Renders a black line between points (256, 178) and (350, 92).
; PLAN: r0=256(x1), r1=178(y1), r2=350(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 178
LDI r2, 350
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
