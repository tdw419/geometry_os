; DESCRIPTION: Places a yellow line segment connecting (146, 134) to (413, 196).
; PLAN: r0=146(x1), r1=134(y1), r2=413(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 134
LDI r2, 413
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
