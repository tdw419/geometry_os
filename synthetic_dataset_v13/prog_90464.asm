; DESCRIPTION: Draws a blue line from (177, 196) to (206, 152).
; PLAN: r0=177(x1), r1=196(y1), r2=206(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 196
LDI r2, 206
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
