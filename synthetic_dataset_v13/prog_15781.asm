; DESCRIPTION: Places a cyan line segment connecting (99, 56) to (124, 71).
; PLAN: r0=99(x1), r1=56(y1), r2=124(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 56
LDI r2, 124
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
