; DESCRIPTION: Places a cyan line segment connecting (183, 126) to (489, 73).
; PLAN: r0=183(x1), r1=126(y1), r2=489(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 126
LDI r2, 489
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
