; DESCRIPTION: Places a cyan line segment connecting (292, 69) to (454, 168).
; PLAN: r0=292(x1), r1=69(y1), r2=454(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 69
LDI r2, 454
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
