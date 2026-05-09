; DESCRIPTION: Places a purple line segment connecting (255, 175) to (187, 60).
; PLAN: r0=255(x1), r1=175(y1), r2=187(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 175
LDI r2, 187
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
