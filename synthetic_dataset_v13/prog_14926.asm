; DESCRIPTION: Draws a red line from (281, 2) to (247, 42).
; PLAN: r0=281(x1), r1=2(y1), r2=247(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 2
LDI r2, 247
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
