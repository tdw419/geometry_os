; DESCRIPTION: Places a red line segment connecting (301, 42) to (174, 160).
; PLAN: r0=301(x1), r1=42(y1), r2=174(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 42
LDI r2, 174
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
