; DESCRIPTION: Places a cyan line segment connecting (83, 184) to (171, 55).
; PLAN: r0=83(x1), r1=184(y1), r2=171(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 184
LDI r2, 171
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
