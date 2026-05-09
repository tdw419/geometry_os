; DESCRIPTION: Places a cyan line segment connecting (113, 49) to (383, 92).
; PLAN: r0=113(x1), r1=49(y1), r2=383(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 49
LDI r2, 383
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
