; DESCRIPTION: Places a cyan line segment connecting (188, 9) to (494, 55).
; PLAN: r0=188(x1), r1=9(y1), r2=494(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 9
LDI r2, 494
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
