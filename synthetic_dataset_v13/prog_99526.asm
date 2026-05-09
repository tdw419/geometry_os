; DESCRIPTION: Places a cyan line segment connecting (254, 144) to (274, 31).
; PLAN: r0=254(x1), r1=144(y1), r2=274(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 144
LDI r2, 274
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
