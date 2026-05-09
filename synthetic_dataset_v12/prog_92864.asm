; DESCRIPTION: Places a orange line segment connecting (215, 221) to (301, 93).
; PLAN: r0=215(x1), r1=221(y1), r2=301(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 221
LDI r2, 301
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
