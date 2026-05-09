; DESCRIPTION: Places a green line segment connecting (240, 38) to (196, 223).
; PLAN: r0=240(x1), r1=38(y1), r2=196(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 38
LDI r2, 196
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
