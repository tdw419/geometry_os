; DESCRIPTION: Places a cyan line segment connecting (291, 131) to (379, 55).
; PLAN: r0=291(x1), r1=131(y1), r2=379(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 131
LDI r2, 379
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
