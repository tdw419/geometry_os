; DESCRIPTION: Places a cyan line segment connecting (28, 115) to (135, 226).
; PLAN: r0=28(x1), r1=115(y1), r2=135(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 115
LDI r2, 135
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
