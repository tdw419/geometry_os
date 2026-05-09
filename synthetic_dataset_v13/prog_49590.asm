; DESCRIPTION: Renders a black line between points (36, 243) and (243, 92).
; PLAN: r0=36(x1), r1=243(y1), r2=243(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 243
LDI r2, 243
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
