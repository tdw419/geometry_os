; DESCRIPTION: Renders a black line between points (64, 250) and (1, 132).
; PLAN: r0=64(x1), r1=250(y1), r2=1(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 250
LDI r2, 1
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
