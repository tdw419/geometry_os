; DESCRIPTION: Places a cyan line segment connecting (171, 93) to (477, 229).
; PLAN: r0=171(x1), r1=93(y1), r2=477(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 93
LDI r2, 477
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
