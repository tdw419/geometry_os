; DESCRIPTION: Places a cyan line segment connecting (134, 26) to (262, 75).
; PLAN: r0=134(x1), r1=26(y1), r2=262(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 26
LDI r2, 262
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
