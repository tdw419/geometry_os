; DESCRIPTION: Places a cyan line segment connecting (211, 218) to (96, 28).
; PLAN: r0=211(x1), r1=218(y1), r2=96(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 218
LDI r2, 96
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
