; DESCRIPTION: Places a green line segment connecting (168, 181) to (59, 117).
; PLAN: r0=168(x1), r1=181(y1), r2=59(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 181
LDI r2, 59
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
