; DESCRIPTION: Renders a green line between points (152, 30) and (232, 33).
; PLAN: r0=152(x1), r1=30(y1), r2=232(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 30
LDI r2, 232
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
