; DESCRIPTION: Places a red line segment connecting (305, 84) to (455, 6).
; PLAN: r0=305(x1), r1=84(y1), r2=455(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 84
LDI r2, 455
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
