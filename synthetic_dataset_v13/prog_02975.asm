; DESCRIPTION: Places a white line segment connecting (231, 175) to (360, 253).
; PLAN: r0=231(x1), r1=175(y1), r2=360(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 175
LDI r2, 360
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
