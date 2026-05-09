; DESCRIPTION: Draws a red line from (443, 70) to (79, 103).
; PLAN: r0=443(x1), r1=70(y1), r2=79(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 70
LDI r2, 79
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
