; DESCRIPTION: Places a cyan line segment connecting (144, 59) to (374, 105).
; PLAN: r0=144(x1), r1=59(y1), r2=374(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 59
LDI r2, 374
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
