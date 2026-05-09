; DESCRIPTION: Places a cyan line segment connecting (186, 188) to (134, 75).
; PLAN: r0=186(x1), r1=188(y1), r2=134(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 188
LDI r2, 134
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
