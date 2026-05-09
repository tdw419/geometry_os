; DESCRIPTION: Places a cyan line segment connecting (7, 211) to (193, 230).
; PLAN: r0=7(x1), r1=211(y1), r2=193(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 211
LDI r2, 193
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
