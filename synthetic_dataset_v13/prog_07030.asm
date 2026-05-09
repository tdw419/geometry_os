; DESCRIPTION: Draws a red line from (157, 3) to (502, 96).
; PLAN: r0=157(x1), r1=3(y1), r2=502(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 3
LDI r2, 502
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
