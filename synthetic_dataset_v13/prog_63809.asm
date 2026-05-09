; DESCRIPTION: Places a cyan line segment connecting (336, 146) to (274, 145).
; PLAN: r0=336(x1), r1=146(y1), r2=274(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 146
LDI r2, 274
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
