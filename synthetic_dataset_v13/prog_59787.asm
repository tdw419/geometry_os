; DESCRIPTION: Places a magenta line segment connecting (175, 154) to (410, 112).
; PLAN: r0=175(x1), r1=154(y1), r2=410(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 154
LDI r2, 410
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
