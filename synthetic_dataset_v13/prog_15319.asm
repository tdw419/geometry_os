; DESCRIPTION: Places a green line segment connecting (296, 91) to (464, 184).
; PLAN: r0=296(x1), r1=91(y1), r2=464(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 91
LDI r2, 464
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
