; DESCRIPTION: Places a cyan line segment connecting (436, 58) to (3, 82).
; PLAN: r0=436(x1), r1=58(y1), r2=3(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 58
LDI r2, 3
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
