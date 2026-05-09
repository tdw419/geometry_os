; DESCRIPTION: Places a cyan line segment connecting (419, 165) to (82, 94).
; PLAN: r0=419(x1), r1=165(y1), r2=82(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 165
LDI r2, 82
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
