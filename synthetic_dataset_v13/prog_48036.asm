; DESCRIPTION: Places a cyan line segment connecting (449, 67) to (312, 124).
; PLAN: r0=449(x1), r1=67(y1), r2=312(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 67
LDI r2, 312
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
