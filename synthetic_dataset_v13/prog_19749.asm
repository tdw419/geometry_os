; DESCRIPTION: Draws a purple line from (298, 69) to (322, 188).
; PLAN: r0=298(x1), r1=69(y1), r2=322(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 69
LDI r2, 322
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
