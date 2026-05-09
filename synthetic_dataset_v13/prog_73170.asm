; DESCRIPTION: Draws a blue line from (152, 69) to (368, 167).
; PLAN: r0=152(x1), r1=69(y1), r2=368(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 69
LDI r2, 368
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
