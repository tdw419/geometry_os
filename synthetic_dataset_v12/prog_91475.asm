; DESCRIPTION: Places a cyan line segment connecting (223, 248) to (511, 131).
; PLAN: r0=223(x1), r1=248(y1), r2=511(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 248
LDI r2, 511
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
