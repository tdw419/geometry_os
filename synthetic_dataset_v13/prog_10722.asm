; DESCRIPTION: Places a cyan line segment connecting (388, 102) to (404, 87).
; PLAN: r0=388(x1), r1=102(y1), r2=404(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 102
LDI r2, 404
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
