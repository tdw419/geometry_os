; DESCRIPTION: Places a cyan line segment connecting (44, 96) to (345, 33).
; PLAN: r0=44(x1), r1=96(y1), r2=345(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 96
LDI r2, 345
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
