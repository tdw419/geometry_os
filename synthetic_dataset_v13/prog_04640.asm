; DESCRIPTION: Draws a red line from (365, 154) to (95, 12).
; PLAN: r0=365(x1), r1=154(y1), r2=95(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 154
LDI r2, 95
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
