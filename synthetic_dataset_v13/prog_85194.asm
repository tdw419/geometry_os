; DESCRIPTION: Draws a red line from (197, 221) to (313, 106).
; PLAN: r0=197(x1), r1=221(y1), r2=313(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 221
LDI r2, 313
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
