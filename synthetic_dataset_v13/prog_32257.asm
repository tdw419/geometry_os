; DESCRIPTION: Places a cyan line segment connecting (292, 136) to (335, 83).
; PLAN: r0=292(x1), r1=136(y1), r2=335(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 136
LDI r2, 335
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
