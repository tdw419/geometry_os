; DESCRIPTION: Places a cyan line segment connecting (463, 75) to (120, 252).
; PLAN: r0=463(x1), r1=75(y1), r2=120(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 75
LDI r2, 120
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
