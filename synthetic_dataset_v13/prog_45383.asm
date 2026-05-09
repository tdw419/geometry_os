; DESCRIPTION: Places a magenta line segment connecting (330, 46) to (168, 81).
; PLAN: r0=330(x1), r1=46(y1), r2=168(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 46
LDI r2, 168
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
