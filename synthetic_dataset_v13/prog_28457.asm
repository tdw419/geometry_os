; DESCRIPTION: Places a cyan line segment connecting (335, 50) to (126, 79).
; PLAN: r0=335(x1), r1=50(y1), r2=126(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 50
LDI r2, 126
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
