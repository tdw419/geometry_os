; DESCRIPTION: Draws a cyan line from (423, 177) to (225, 116).
; PLAN: r0=423(x1), r1=177(y1), r2=225(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 177
LDI r2, 225
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
