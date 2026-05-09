; DESCRIPTION: Places a cyan line segment connecting (185, 116) to (98, 197).
; PLAN: r0=185(x1), r1=116(y1), r2=98(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 116
LDI r2, 98
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
