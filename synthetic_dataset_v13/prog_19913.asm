; DESCRIPTION: Places a red line segment connecting (42, 127) to (52, 194).
; PLAN: r0=42(x1), r1=127(y1), r2=52(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 127
LDI r2, 52
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
