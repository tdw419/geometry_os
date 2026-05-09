; DESCRIPTION: Places a yellow line segment connecting (33, 111) to (38, 21).
; PLAN: r0=33(x1), r1=111(y1), r2=38(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 111
LDI r2, 38
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
