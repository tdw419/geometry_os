; DESCRIPTION: Draws a red line from (146, 221) to (414, 160).
; PLAN: r0=146(x1), r1=221(y1), r2=414(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 221
LDI r2, 414
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
