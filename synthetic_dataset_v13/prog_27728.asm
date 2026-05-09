; DESCRIPTION: Places a cyan line segment connecting (67, 150) to (358, 130).
; PLAN: r0=67(x1), r1=150(y1), r2=358(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 150
LDI r2, 358
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
