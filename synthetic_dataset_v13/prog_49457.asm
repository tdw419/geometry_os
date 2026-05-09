; DESCRIPTION: Places a cyan line segment connecting (226, 226) to (308, 156).
; PLAN: r0=226(x1), r1=226(y1), r2=308(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 226
LDI r2, 308
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
