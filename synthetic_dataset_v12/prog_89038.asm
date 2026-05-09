; DESCRIPTION: Places a cyan line segment connecting (321, 99) to (492, 180).
; PLAN: r0=321(x1), r1=99(y1), r2=492(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 99
LDI r2, 492
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
