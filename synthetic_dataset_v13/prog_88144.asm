; DESCRIPTION: Places a cyan line segment connecting (307, 44) to (489, 124).
; PLAN: r0=307(x1), r1=44(y1), r2=489(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 44
LDI r2, 489
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
