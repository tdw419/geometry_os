; DESCRIPTION: Places a cyan line segment connecting (16, 58) to (62, 38).
; PLAN: r0=16(x1), r1=58(y1), r2=62(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 58
LDI r2, 62
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
