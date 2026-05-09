; DESCRIPTION: Places a magenta line segment connecting (211, 160) to (175, 228).
; PLAN: r0=211(x1), r1=160(y1), r2=175(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 160
LDI r2, 175
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
