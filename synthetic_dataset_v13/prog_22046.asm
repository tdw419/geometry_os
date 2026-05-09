; DESCRIPTION: Places a cyan line segment connecting (396, 122) to (376, 68).
; PLAN: r0=396(x1), r1=122(y1), r2=376(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 122
LDI r2, 376
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
