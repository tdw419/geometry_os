; DESCRIPTION: Places a magenta line segment connecting (82, 129) to (61, 221).
; PLAN: r0=82(x1), r1=129(y1), r2=61(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 129
LDI r2, 61
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
