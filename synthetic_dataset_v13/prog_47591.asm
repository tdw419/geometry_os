; DESCRIPTION: Places a yellow line segment connecting (81, 223) to (82, 155).
; PLAN: r0=81(x1), r1=223(y1), r2=82(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 223
LDI r2, 82
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
