; DESCRIPTION: Places a red line segment connecting (48, 11) to (354, 104).
; PLAN: r0=48(x1), r1=11(y1), r2=354(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 11
LDI r2, 354
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
