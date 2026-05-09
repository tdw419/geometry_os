; DESCRIPTION: Places a cyan line segment connecting (494, 236) to (397, 105).
; PLAN: r0=494(x1), r1=236(y1), r2=397(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 236
LDI r2, 397
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
