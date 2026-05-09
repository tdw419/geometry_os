; DESCRIPTION: Places a cyan line segment connecting (278, 199) to (290, 184).
; PLAN: r0=278(x1), r1=199(y1), r2=290(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 199
LDI r2, 290
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
