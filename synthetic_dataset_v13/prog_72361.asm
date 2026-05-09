; DESCRIPTION: Places a cyan line segment connecting (258, 92) to (439, 152).
; PLAN: r0=258(x1), r1=92(y1), r2=439(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 92
LDI r2, 439
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
