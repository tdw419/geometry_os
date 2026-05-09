; DESCRIPTION: Places a red line segment connecting (150, 42) to (278, 185).
; PLAN: r0=150(x1), r1=42(y1), r2=278(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 42
LDI r2, 278
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
