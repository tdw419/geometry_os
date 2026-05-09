; DESCRIPTION: Renders a cyan line between points (132, 87) and (101, 252).
; PLAN: r0=132(x1), r1=87(y1), r2=101(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 87
LDI r2, 101
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
