; DESCRIPTION: Renders a green line between points (11, 208) and (67, 52).
; PLAN: r0=11(x1), r1=208(y1), r2=67(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 208
LDI r2, 67
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
