; DESCRIPTION: Places a cyan line segment connecting (82, 143) to (334, 79).
; PLAN: r0=82(x1), r1=143(y1), r2=334(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 143
LDI r2, 334
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
