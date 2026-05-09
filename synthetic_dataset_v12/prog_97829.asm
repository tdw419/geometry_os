; DESCRIPTION: Places a cyan line segment connecting (456, 33) to (290, 135).
; PLAN: r0=456(x1), r1=33(y1), r2=290(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 33
LDI r2, 290
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
