; DESCRIPTION: Renders a green line between points (56, 196) and (313, 33).
; PLAN: r0=56(x1), r1=196(y1), r2=313(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 196
LDI r2, 313
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
