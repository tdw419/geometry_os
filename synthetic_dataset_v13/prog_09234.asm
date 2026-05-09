; DESCRIPTION: Places a cyan line segment connecting (340, 250) to (165, 99).
; PLAN: r0=340(x1), r1=250(y1), r2=165(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 250
LDI r2, 165
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
