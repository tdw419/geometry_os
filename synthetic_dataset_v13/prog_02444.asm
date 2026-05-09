; DESCRIPTION: Draws a red line from (450, 50) to (116, 52).
; PLAN: r0=450(x1), r1=50(y1), r2=116(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 50
LDI r2, 116
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
