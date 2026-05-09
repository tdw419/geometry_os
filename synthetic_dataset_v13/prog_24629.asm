; DESCRIPTION: Places a magenta line segment connecting (146, 14) to (373, 208).
; PLAN: r0=146(x1), r1=14(y1), r2=373(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 14
LDI r2, 373
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
