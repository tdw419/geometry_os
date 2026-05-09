; DESCRIPTION: Places a cyan line segment connecting (384, 35) to (4, 116).
; PLAN: r0=384(x1), r1=35(y1), r2=4(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 35
LDI r2, 4
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
