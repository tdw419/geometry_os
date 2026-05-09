; DESCRIPTION: Places a magenta line segment connecting (59, 33) to (202, 188).
; PLAN: r0=59(x1), r1=33(y1), r2=202(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 33
LDI r2, 202
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
