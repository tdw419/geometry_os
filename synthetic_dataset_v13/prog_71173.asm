; DESCRIPTION: Draws a cyan line from (238, 104) to (253, 133).
; PLAN: r0=238(x1), r1=104(y1), r2=253(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 104
LDI r2, 253
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
