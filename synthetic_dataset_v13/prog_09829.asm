; DESCRIPTION: Places a cyan line segment connecting (492, 75) to (66, 175).
; PLAN: r0=492(x1), r1=75(y1), r2=66(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 75
LDI r2, 66
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
