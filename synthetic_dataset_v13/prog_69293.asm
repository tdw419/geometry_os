; DESCRIPTION: Renders a black line between points (18, 135) and (39, 63).
; PLAN: r0=18(x1), r1=135(y1), r2=39(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 135
LDI r2, 39
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
