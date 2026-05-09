; DESCRIPTION: Places a cyan line segment connecting (347, 212) to (50, 126).
; PLAN: r0=347(x1), r1=212(y1), r2=50(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 212
LDI r2, 50
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
