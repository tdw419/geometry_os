; DESCRIPTION: Renders a green line between points (109, 28) and (211, 222).
; PLAN: r0=109(x1), r1=28(y1), r2=211(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 28
LDI r2, 211
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
