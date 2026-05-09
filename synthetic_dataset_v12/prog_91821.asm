; DESCRIPTION: Renders a yellow line between points (171, 244) and (77, 84).
; PLAN: r0=171(x1), r1=244(y1), r2=77(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 244
LDI r2, 77
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
