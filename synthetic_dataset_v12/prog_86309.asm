; DESCRIPTION: Places a cyan line segment connecting (289, 247) to (449, 67).
; PLAN: r0=289(x1), r1=247(y1), r2=449(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 247
LDI r2, 449
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
