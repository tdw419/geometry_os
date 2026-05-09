; DESCRIPTION: Places a blue line segment connecting (345, 19) to (410, 138).
; PLAN: r0=345(x1), r1=19(y1), r2=410(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 19
LDI r2, 410
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
