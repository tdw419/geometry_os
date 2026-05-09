; DESCRIPTION: Renders a black line between points (23, 32) and (385, 161).
; PLAN: r0=23(x1), r1=32(y1), r2=385(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 32
LDI r2, 385
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
