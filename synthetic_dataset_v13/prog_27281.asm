; DESCRIPTION: Renders a green line between points (56, 24) and (86, 242).
; PLAN: r0=56(x1), r1=24(y1), r2=86(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 24
LDI r2, 86
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
