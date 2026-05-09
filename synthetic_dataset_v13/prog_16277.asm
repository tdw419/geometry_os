; DESCRIPTION: Places a cyan line segment connecting (265, 91) to (13, 28).
; PLAN: r0=265(x1), r1=91(y1), r2=13(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 91
LDI r2, 13
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
