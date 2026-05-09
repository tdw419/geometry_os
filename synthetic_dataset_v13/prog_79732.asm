; DESCRIPTION: Places a cyan line segment connecting (250, 75) to (340, 240).
; PLAN: r0=250(x1), r1=75(y1), r2=340(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 75
LDI r2, 340
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
