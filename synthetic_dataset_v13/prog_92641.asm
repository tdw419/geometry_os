; DESCRIPTION: Places a cyan line segment connecting (313, 77) to (96, 255).
; PLAN: r0=313(x1), r1=77(y1), r2=96(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 77
LDI r2, 96
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
