; DESCRIPTION: Draws a cyan line from (403, 230) to (312, 158).
; PLAN: r0=403(x1), r1=230(y1), r2=312(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 230
LDI r2, 312
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
