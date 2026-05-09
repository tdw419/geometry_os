; DESCRIPTION: Renders a magenta line between points (447, 93) and (331, 204).
; PLAN: r0=447(x1), r1=93(y1), r2=331(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 93
LDI r2, 331
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
