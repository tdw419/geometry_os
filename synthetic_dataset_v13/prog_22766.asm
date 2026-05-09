; DESCRIPTION: Draws a red line from (498, 184) to (42, 37).
; PLAN: r0=498(x1), r1=184(y1), r2=42(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 184
LDI r2, 42
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
