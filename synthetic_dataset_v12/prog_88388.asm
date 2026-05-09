; DESCRIPTION: Draws a blue line from (362, 233) to (152, 143).
; PLAN: r0=362(x1), r1=233(y1), r2=152(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 233
LDI r2, 152
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
