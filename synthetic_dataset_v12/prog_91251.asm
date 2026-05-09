; DESCRIPTION: Places a green line segment connecting (324, 249) to (68, 39).
; PLAN: r0=324(x1), r1=249(y1), r2=68(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 249
LDI r2, 68
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
