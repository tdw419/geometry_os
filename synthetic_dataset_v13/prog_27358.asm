; DESCRIPTION: Renders a green line between points (491, 154) and (454, 196).
; PLAN: r0=491(x1), r1=154(y1), r2=454(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 154
LDI r2, 454
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
