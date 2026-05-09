; DESCRIPTION: Places a cyan line segment connecting (473, 111) to (54, 162).
; PLAN: r0=473(x1), r1=111(y1), r2=54(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 111
LDI r2, 54
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
