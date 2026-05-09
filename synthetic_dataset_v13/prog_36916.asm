; DESCRIPTION: Places a magenta line segment connecting (114, 249) to (202, 54).
; PLAN: r0=114(x1), r1=249(y1), r2=202(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 249
LDI r2, 202
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
