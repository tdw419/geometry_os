; DESCRIPTION: Places a cyan line segment connecting (489, 39) to (461, 124).
; PLAN: r0=489(x1), r1=39(y1), r2=461(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 39
LDI r2, 461
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
