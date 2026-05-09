; DESCRIPTION: Places a cyan line segment connecting (233, 17) to (383, 175).
; PLAN: r0=233(x1), r1=17(y1), r2=383(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 17
LDI r2, 383
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
