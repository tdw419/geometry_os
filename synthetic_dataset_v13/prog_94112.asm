; DESCRIPTION: Draws a blue line from (186, 187) to (122, 113).
; PLAN: r0=186(x1), r1=187(y1), r2=122(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 187
LDI r2, 122
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
