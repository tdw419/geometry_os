; DESCRIPTION: Places a cyan line segment connecting (24, 70) to (321, 144).
; PLAN: r0=24(x1), r1=70(y1), r2=321(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 70
LDI r2, 321
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
