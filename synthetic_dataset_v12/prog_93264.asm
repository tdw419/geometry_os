; DESCRIPTION: Places a cyan line segment connecting (18, 38) to (475, 247).
; PLAN: r0=18(x1), r1=38(y1), r2=475(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 38
LDI r2, 475
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
