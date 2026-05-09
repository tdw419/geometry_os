; DESCRIPTION: Places a magenta line segment connecting (425, 76) to (168, 208).
; PLAN: r0=425(x1), r1=76(y1), r2=168(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 76
LDI r2, 168
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
