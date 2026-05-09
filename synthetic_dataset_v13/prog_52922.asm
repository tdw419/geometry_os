; DESCRIPTION: Places a cyan line segment connecting (490, 12) to (404, 179).
; PLAN: r0=490(x1), r1=12(y1), r2=404(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 12
LDI r2, 404
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
