; DESCRIPTION: Places a yellow line segment connecting (502, 95) to (24, 212).
; PLAN: r0=502(x1), r1=95(y1), r2=24(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 95
LDI r2, 24
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
