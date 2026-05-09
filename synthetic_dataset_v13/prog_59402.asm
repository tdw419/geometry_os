; DESCRIPTION: Places a cyan line segment connecting (126, 252) to (90, 52).
; PLAN: r0=126(x1), r1=252(y1), r2=90(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 252
LDI r2, 90
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
