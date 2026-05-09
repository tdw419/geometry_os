; DESCRIPTION: Renders a green line between points (205, 53) and (32, 114).
; PLAN: r0=205(x1), r1=53(y1), r2=32(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 53
LDI r2, 32
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
