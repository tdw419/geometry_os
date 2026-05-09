; DESCRIPTION: Draws a red line from (186, 14) to (213, 139).
; PLAN: r0=186(x1), r1=14(y1), r2=213(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 14
LDI r2, 213
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
