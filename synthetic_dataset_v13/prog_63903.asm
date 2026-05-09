; DESCRIPTION: Places a cyan line segment connecting (450, 95) to (119, 34).
; PLAN: r0=450(x1), r1=95(y1), r2=119(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 95
LDI r2, 119
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
