; DESCRIPTION: Places a cyan line segment connecting (1, 238) to (282, 131).
; PLAN: r0=1(x1), r1=238(y1), r2=282(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 238
LDI r2, 282
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
