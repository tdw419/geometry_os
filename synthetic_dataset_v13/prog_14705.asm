; DESCRIPTION: Renders a green line between points (296, 34) and (203, 33).
; PLAN: r0=296(x1), r1=34(y1), r2=203(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 34
LDI r2, 203
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
