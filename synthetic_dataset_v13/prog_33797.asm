; DESCRIPTION: Places a blue line segment connecting (467, 124) to (437, 111).
; PLAN: r0=467(x1), r1=124(y1), r2=437(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 124
LDI r2, 437
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
