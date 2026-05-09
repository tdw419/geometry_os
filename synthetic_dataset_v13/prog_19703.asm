; DESCRIPTION: Places a red line segment connecting (184, 194) to (307, 108).
; PLAN: r0=184(x1), r1=194(y1), r2=307(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 194
LDI r2, 307
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
