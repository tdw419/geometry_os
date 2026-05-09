; DESCRIPTION: Places a cyan line segment connecting (175, 175) to (463, 24).
; PLAN: r0=175(x1), r1=175(y1), r2=463(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 175
LDI r2, 463
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
