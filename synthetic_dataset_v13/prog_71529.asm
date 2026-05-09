; DESCRIPTION: Places a yellow line segment connecting (275, 179) to (86, 103).
; PLAN: r0=275(x1), r1=179(y1), r2=86(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 179
LDI r2, 86
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
