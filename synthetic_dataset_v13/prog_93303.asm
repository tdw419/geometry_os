; DESCRIPTION: Places a cyan line segment connecting (66, 91) to (395, 96).
; PLAN: r0=66(x1), r1=91(y1), r2=395(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 91
LDI r2, 395
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
