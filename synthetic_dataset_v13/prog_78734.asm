; DESCRIPTION: Places a cyan line segment connecting (354, 119) to (404, 199).
; PLAN: r0=354(x1), r1=119(y1), r2=404(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 119
LDI r2, 404
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
