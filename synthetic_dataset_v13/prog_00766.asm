; DESCRIPTION: Places a cyan line segment connecting (54, 114) to (351, 175).
; PLAN: r0=54(x1), r1=114(y1), r2=351(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 114
LDI r2, 351
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
