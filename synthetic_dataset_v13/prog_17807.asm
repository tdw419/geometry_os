; DESCRIPTION: Places a cyan line segment connecting (321, 183) to (377, 161).
; PLAN: r0=321(x1), r1=183(y1), r2=377(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 183
LDI r2, 377
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
