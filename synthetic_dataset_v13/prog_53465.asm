; DESCRIPTION: Places a cyan line segment connecting (96, 211) to (65, 165).
; PLAN: r0=96(x1), r1=211(y1), r2=65(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 211
LDI r2, 65
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
