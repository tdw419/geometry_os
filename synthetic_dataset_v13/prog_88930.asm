; DESCRIPTION: Places a magenta line segment connecting (280, 168) to (233, 198).
; PLAN: r0=280(x1), r1=168(y1), r2=233(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 168
LDI r2, 233
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
