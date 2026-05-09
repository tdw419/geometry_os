; DESCRIPTION: Places a cyan line segment connecting (436, 60) to (413, 160).
; PLAN: r0=436(x1), r1=60(y1), r2=413(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 60
LDI r2, 413
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
