; DESCRIPTION: Places a cyan line segment connecting (223, 13) to (274, 74).
; PLAN: r0=223(x1), r1=13(y1), r2=274(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 13
LDI r2, 274
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
