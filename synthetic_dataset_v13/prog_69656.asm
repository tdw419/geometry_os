; DESCRIPTION: Renders a cyan line between points (312, 208) and (88, 54).
; PLAN: r0=312(x1), r1=208(y1), r2=88(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 208
LDI r2, 88
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
