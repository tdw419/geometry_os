; DESCRIPTION: Places a cyan line segment connecting (376, 22) to (269, 37).
; PLAN: r0=376(x1), r1=22(y1), r2=269(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 22
LDI r2, 269
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
