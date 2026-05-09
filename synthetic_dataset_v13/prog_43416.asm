; DESCRIPTION: Places a cyan line segment connecting (283, 222) to (24, 157).
; PLAN: r0=283(x1), r1=222(y1), r2=24(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 222
LDI r2, 24
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
