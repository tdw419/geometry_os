; DESCRIPTION: Places a cyan line segment connecting (165, 22) to (96, 226).
; PLAN: r0=165(x1), r1=22(y1), r2=96(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 22
LDI r2, 96
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
