; DESCRIPTION: Draws a yellow line from (322, 230) to (171, 241).
; PLAN: r0=322(x1), r1=230(y1), r2=171(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 230
LDI r2, 171
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
