; DESCRIPTION: Renders a green line between points (247, 16) and (99, 224).
; PLAN: r0=247(x1), r1=16(y1), r2=99(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 16
LDI r2, 99
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
