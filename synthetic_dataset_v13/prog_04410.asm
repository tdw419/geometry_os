; DESCRIPTION: Draws a cyan line from (89, 207) to (232, 218).
; PLAN: r0=89(x1), r1=207(y1), r2=232(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 207
LDI r2, 232
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
