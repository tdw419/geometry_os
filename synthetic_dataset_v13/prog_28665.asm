; DESCRIPTION: Places a green line segment connecting (415, 58) to (225, 37).
; PLAN: r0=415(x1), r1=58(y1), r2=225(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 58
LDI r2, 225
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
