; DESCRIPTION: Places a green line segment connecting (292, 7) to (11, 71).
; PLAN: r0=292(x1), r1=7(y1), r2=11(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 7
LDI r2, 11
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
