; DESCRIPTION: Draws a red line from (308, 221) to (406, 48).
; PLAN: r0=308(x1), r1=221(y1), r2=406(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 221
LDI r2, 406
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
