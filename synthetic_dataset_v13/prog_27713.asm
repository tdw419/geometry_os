; DESCRIPTION: Renders a green line between points (501, 208) and (1, 10).
; PLAN: r0=501(x1), r1=208(y1), r2=1(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 208
LDI r2, 1
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
