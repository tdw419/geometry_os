; DESCRIPTION: Draws a red line from (466, 141) to (58, 192).
; PLAN: r0=466(x1), r1=141(y1), r2=58(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 141
LDI r2, 58
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
