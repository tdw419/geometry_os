; DESCRIPTION: Renders a white line between points (218, 84) and (453, 249).
; PLAN: r0=218(x1), r1=84(y1), r2=453(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 84
LDI r2, 453
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
