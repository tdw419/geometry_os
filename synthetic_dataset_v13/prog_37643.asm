; DESCRIPTION: Places a blue line segment connecting (281, 129) to (257, 186).
; PLAN: r0=281(x1), r1=129(y1), r2=257(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 129
LDI r2, 257
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
