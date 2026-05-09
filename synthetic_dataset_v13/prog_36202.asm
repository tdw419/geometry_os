; DESCRIPTION: Places a magenta line segment connecting (213, 232) to (281, 31).
; PLAN: r0=213(x1), r1=232(y1), r2=281(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 232
LDI r2, 281
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
