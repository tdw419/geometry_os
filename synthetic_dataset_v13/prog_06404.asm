; DESCRIPTION: Renders a green line between points (454, 127) and (13, 5).
; PLAN: r0=454(x1), r1=127(y1), r2=13(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 127
LDI r2, 13
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
