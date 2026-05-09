; DESCRIPTION: Places a magenta line segment connecting (300, 196) to (182, 243).
; PLAN: r0=300(x1), r1=196(y1), r2=182(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 196
LDI r2, 182
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
