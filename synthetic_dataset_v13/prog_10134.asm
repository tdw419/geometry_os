; DESCRIPTION: Places a magenta line segment connecting (54, 186) to (197, 52).
; PLAN: r0=54(x1), r1=186(y1), r2=197(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 186
LDI r2, 197
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
