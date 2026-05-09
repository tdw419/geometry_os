; DESCRIPTION: Draws a blue line from (104, 152) to (184, 118).
; PLAN: r0=104(x1), r1=152(y1), r2=184(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 152
LDI r2, 184
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
