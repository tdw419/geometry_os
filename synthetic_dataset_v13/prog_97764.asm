; DESCRIPTION: Draws a red line from (473, 42) to (260, 30).
; PLAN: r0=473(x1), r1=42(y1), r2=260(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 42
LDI r2, 260
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
