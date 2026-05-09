; DESCRIPTION: Renders a black line between points (313, 237) and (271, 32).
; PLAN: r0=313(x1), r1=237(y1), r2=271(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 237
LDI r2, 271
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
