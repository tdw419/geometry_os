; DESCRIPTION: Draws a red line from (42, 2) to (120, 64).
; PLAN: r0=42(x1), r1=2(y1), r2=120(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 2
LDI r2, 120
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
