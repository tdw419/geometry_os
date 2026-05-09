; DESCRIPTION: Places a cyan line segment connecting (407, 111) to (473, 181).
; PLAN: r0=407(x1), r1=111(y1), r2=473(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 111
LDI r2, 473
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
