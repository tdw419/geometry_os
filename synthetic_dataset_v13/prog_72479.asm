; DESCRIPTION: Places a yellow line segment connecting (174, 20) to (327, 212).
; PLAN: r0=174(x1), r1=20(y1), r2=327(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 20
LDI r2, 327
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
