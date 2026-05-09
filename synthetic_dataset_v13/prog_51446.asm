; DESCRIPTION: Places a cyan line segment connecting (359, 193) to (33, 250).
; PLAN: r0=359(x1), r1=193(y1), r2=33(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 193
LDI r2, 33
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
