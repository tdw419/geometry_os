; DESCRIPTION: Draws a red line from (154, 115) to (180, 207).
; PLAN: r0=154(x1), r1=115(y1), r2=180(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 115
LDI r2, 180
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
