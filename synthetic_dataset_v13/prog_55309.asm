; DESCRIPTION: Draws a green line from (237, 104) to (177, 153).
; PLAN: r0=237(x1), r1=104(y1), r2=177(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 104
LDI r2, 177
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
