; DESCRIPTION: Places a yellow line segment connecting (499, 76) to (396, 68).
; PLAN: r0=499(x1), r1=76(y1), r2=396(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 76
LDI r2, 396
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
