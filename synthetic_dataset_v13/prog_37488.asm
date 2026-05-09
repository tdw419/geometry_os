; DESCRIPTION: Places a red line segment connecting (320, 82) to (463, 190).
; PLAN: r0=320(x1), r1=82(y1), r2=463(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 82
LDI r2, 463
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
