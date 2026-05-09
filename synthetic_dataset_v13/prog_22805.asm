; DESCRIPTION: Draws a red line from (452, 191) to (278, 42).
; PLAN: r0=452(x1), r1=191(y1), r2=278(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 191
LDI r2, 278
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
