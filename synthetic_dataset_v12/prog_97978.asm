; DESCRIPTION: Places a magenta line segment connecting (265, 138) to (435, 221).
; PLAN: r0=265(x1), r1=138(y1), r2=435(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 138
LDI r2, 435
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
