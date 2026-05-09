; DESCRIPTION: Draws a black line from (322, 249) to (33, 210).
; PLAN: r0=322(x1), r1=249(y1), r2=33(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 249
LDI r2, 33
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
