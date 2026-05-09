; DESCRIPTION: Draws a red line from (197, 25) to (503, 193).
; PLAN: r0=197(x1), r1=25(y1), r2=503(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 25
LDI r2, 503
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
