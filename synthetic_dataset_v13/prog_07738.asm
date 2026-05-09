; DESCRIPTION: Draws a cyan line from (166, 24) to (357, 218).
; PLAN: r0=166(x1), r1=24(y1), r2=357(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 24
LDI r2, 357
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
