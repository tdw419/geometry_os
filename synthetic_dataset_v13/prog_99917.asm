; DESCRIPTION: Renders a cyan line between points (100, 37) and (457, 224).
; PLAN: r0=100(x1), r1=37(y1), r2=457(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 37
LDI r2, 457
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
