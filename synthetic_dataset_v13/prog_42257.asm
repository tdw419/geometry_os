; DESCRIPTION: Places a green line segment connecting (478, 59) to (19, 27).
; PLAN: r0=478(x1), r1=59(y1), r2=19(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 59
LDI r2, 19
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
