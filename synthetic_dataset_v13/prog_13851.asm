; DESCRIPTION: Places a cyan line segment connecting (270, 218) to (361, 25).
; PLAN: r0=270(x1), r1=218(y1), r2=361(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 218
LDI r2, 361
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
