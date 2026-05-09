; DESCRIPTION: Renders a yellow line between points (499, 250) and (196, 45).
; PLAN: r0=499(x1), r1=250(y1), r2=196(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 250
LDI r2, 196
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
