; DESCRIPTION: Draws a cyan line from (165, 36) to (118, 74).
; PLAN: r0=165(x1), r1=36(y1), r2=118(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 36
LDI r2, 118
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
