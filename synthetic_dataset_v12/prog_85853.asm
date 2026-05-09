; DESCRIPTION: Places a red line segment connecting (494, 35) to (289, 231).
; PLAN: r0=494(x1), r1=35(y1), r2=289(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 35
LDI r2, 289
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
