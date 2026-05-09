; DESCRIPTION: Places a cyan line segment connecting (225, 32) to (452, 133).
; PLAN: r0=225(x1), r1=32(y1), r2=452(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 32
LDI r2, 452
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
