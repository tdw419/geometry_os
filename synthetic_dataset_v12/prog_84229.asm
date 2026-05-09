; DESCRIPTION: Places a cyan line segment connecting (301, 232) to (168, 82).
; PLAN: r0=301(x1), r1=232(y1), r2=168(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 232
LDI r2, 168
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
