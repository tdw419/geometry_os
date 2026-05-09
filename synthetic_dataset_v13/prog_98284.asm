; DESCRIPTION: Places a cyan line segment connecting (45, 252) to (450, 10).
; PLAN: r0=45(x1), r1=252(y1), r2=450(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 252
LDI r2, 450
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
