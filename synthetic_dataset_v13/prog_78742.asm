; DESCRIPTION: Draws a red line from (322, 215) to (69, 121).
; PLAN: r0=322(x1), r1=215(y1), r2=69(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 215
LDI r2, 69
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
