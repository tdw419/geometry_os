; DESCRIPTION: Places a cyan line segment connecting (274, 8) to (229, 8).
; PLAN: r0=274(x1), r1=8(y1), r2=229(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 8
LDI r2, 229
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
