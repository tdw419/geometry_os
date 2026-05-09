; DESCRIPTION: Places a cyan line segment connecting (171, 42) to (309, 79).
; PLAN: r0=171(x1), r1=42(y1), r2=309(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 42
LDI r2, 309
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
