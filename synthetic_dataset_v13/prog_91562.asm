; DESCRIPTION: Places a cyan line segment connecting (8, 211) to (6, 90).
; PLAN: r0=8(x1), r1=211(y1), r2=6(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 211
LDI r2, 6
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
