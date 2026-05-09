; DESCRIPTION: Renders a green line between points (244, 161) and (273, 83).
; PLAN: r0=244(x1), r1=161(y1), r2=273(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 161
LDI r2, 273
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
