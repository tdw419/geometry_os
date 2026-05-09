; DESCRIPTION: Places a green line segment connecting (39, 166) to (89, 28).
; PLAN: r0=39(x1), r1=166(y1), r2=89(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 166
LDI r2, 89
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
