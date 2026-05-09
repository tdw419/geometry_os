; DESCRIPTION: Places a cyan line segment connecting (395, 178) to (444, 66).
; PLAN: r0=395(x1), r1=178(y1), r2=444(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 178
LDI r2, 444
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
