; DESCRIPTION: Places a cyan line segment connecting (125, 33) to (34, 183).
; PLAN: r0=125(x1), r1=33(y1), r2=34(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 33
LDI r2, 34
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
