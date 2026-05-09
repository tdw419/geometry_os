; DESCRIPTION: Draws a red line from (443, 60) to (502, 179).
; PLAN: r0=443(x1), r1=60(y1), r2=502(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 60
LDI r2, 502
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
