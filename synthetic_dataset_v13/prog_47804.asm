; DESCRIPTION: Draws a red line from (211, 50) to (365, 59).
; PLAN: r0=211(x1), r1=50(y1), r2=365(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 50
LDI r2, 365
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
