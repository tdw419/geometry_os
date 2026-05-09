; DESCRIPTION: Places a magenta line segment connecting (168, 43) to (18, 160).
; PLAN: r0=168(x1), r1=43(y1), r2=18(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 43
LDI r2, 18
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
