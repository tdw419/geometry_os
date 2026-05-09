; DESCRIPTION: Places a red line segment connecting (10, 10) to (12, 228).
; PLAN: r0=10(x1), r1=10(y1), r2=12(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 10
LDI r2, 12
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
