; DESCRIPTION: Places a yellow line segment connecting (320, 123) to (296, 107).
; PLAN: r0=320(x1), r1=123(y1), r2=296(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 123
LDI r2, 296
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
