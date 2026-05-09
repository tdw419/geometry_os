; DESCRIPTION: Places a white line segment connecting (139, 186) to (404, 240).
; PLAN: r0=139(x1), r1=186(y1), r2=404(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 186
LDI r2, 404
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
