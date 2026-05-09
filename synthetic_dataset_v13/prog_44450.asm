; DESCRIPTION: Draws a red line from (443, 190) to (102, 173).
; PLAN: r0=443(x1), r1=190(y1), r2=102(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 190
LDI r2, 102
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
