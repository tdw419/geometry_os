; DESCRIPTION: Places a green line segment connecting (8, 253) to (68, 177).
; PLAN: r0=8(x1), r1=253(y1), r2=68(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 253
LDI r2, 68
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
