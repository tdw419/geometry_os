; DESCRIPTION: Places a cyan line segment connecting (118, 67) to (506, 130).
; PLAN: r0=118(x1), r1=67(y1), r2=506(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 67
LDI r2, 506
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
