; DESCRIPTION: Places a cyan line segment connecting (418, 65) to (184, 199).
; PLAN: r0=418(x1), r1=65(y1), r2=184(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 65
LDI r2, 184
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
