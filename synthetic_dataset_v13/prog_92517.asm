; DESCRIPTION: Places a yellow line segment connecting (452, 183) to (168, 83).
; PLAN: r0=452(x1), r1=183(y1), r2=168(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 183
LDI r2, 168
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
