; DESCRIPTION: Places a cyan line segment connecting (118, 31) to (467, 67).
; PLAN: r0=118(x1), r1=31(y1), r2=467(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 31
LDI r2, 467
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
