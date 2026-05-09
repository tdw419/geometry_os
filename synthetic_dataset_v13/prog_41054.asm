; DESCRIPTION: Renders a green line between points (464, 21) and (97, 244).
; PLAN: r0=464(x1), r1=21(y1), r2=97(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 21
LDI r2, 97
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
