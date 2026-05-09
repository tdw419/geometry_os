; DESCRIPTION: Places a cyan line segment connecting (181, 92) to (383, 6).
; PLAN: r0=181(x1), r1=92(y1), r2=383(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 92
LDI r2, 383
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
