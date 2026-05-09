; DESCRIPTION: Places a cyan line segment connecting (472, 58) to (257, 47).
; PLAN: r0=472(x1), r1=58(y1), r2=257(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 58
LDI r2, 257
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
