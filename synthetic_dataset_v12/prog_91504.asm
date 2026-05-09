; DESCRIPTION: Draws a red line from (342, 73) to (365, 139).
; PLAN: r0=342(x1), r1=73(y1), r2=365(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 73
LDI r2, 365
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
