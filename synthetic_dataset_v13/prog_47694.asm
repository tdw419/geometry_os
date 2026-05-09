; DESCRIPTION: Renders a yellow line between points (8, 204) and (64, 30).
; PLAN: r0=8(x1), r1=204(y1), r2=64(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 204
LDI r2, 64
LDI r3, 30
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
