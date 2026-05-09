; DESCRIPTION: Places a red line segment connecting (262, 157) to (278, 166).
; PLAN: r0=262(x1), r1=157(y1), r2=278(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 157
LDI r2, 278
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
