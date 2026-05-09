; DESCRIPTION: Draws a cyan line from (238, 53) to (503, 155).
; PLAN: r0=238(x1), r1=53(y1), r2=503(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 53
LDI r2, 503
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
