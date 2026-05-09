; DESCRIPTION: Draws a red line from (197, 171) to (202, 80).
; PLAN: r0=197(x1), r1=171(y1), r2=202(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 171
LDI r2, 202
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
