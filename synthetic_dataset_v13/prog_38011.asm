; DESCRIPTION: Places a magenta line segment connecting (233, 151) to (243, 209).
; PLAN: r0=233(x1), r1=151(y1), r2=243(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 151
LDI r2, 243
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
