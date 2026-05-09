; DESCRIPTION: Renders a cyan line between points (101, 224) and (252, 227).
; PLAN: r0=101(x1), r1=224(y1), r2=252(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 224
LDI r2, 252
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
