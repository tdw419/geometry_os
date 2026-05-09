; DESCRIPTION: Places a cyan line segment connecting (381, 19) to (194, 207).
; PLAN: r0=381(x1), r1=19(y1), r2=194(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 19
LDI r2, 194
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
