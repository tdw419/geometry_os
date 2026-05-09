; DESCRIPTION: Places a cyan line segment connecting (256, 102) to (256, 55).
; PLAN: r0=256(x1), r1=102(y1), r2=256(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 102
LDI r2, 256
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
