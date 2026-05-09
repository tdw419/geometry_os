; DESCRIPTION: Places a cyan line segment connecting (320, 159) to (311, 168).
; PLAN: r0=320(x1), r1=159(y1), r2=311(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 159
LDI r2, 311
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
