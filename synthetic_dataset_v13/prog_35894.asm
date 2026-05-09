; DESCRIPTION: Places a magenta line segment connecting (450, 135) to (202, 225).
; PLAN: r0=450(x1), r1=135(y1), r2=202(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 135
LDI r2, 202
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
