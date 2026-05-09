; DESCRIPTION: Places a cyan line segment connecting (311, 251) to (176, 42).
; PLAN: r0=311(x1), r1=251(y1), r2=176(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 251
LDI r2, 176
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
