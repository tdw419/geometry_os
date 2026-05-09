; DESCRIPTION: Places a cyan line segment connecting (163, 16) to (69, 165).
; PLAN: r0=163(x1), r1=16(y1), r2=69(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 16
LDI r2, 69
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
