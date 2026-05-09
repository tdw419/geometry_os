; DESCRIPTION: Draws a red line from (198, 102) to (154, 120).
; PLAN: r0=198(x1), r1=102(y1), r2=154(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 102
LDI r2, 154
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
