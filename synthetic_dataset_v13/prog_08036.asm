; DESCRIPTION: Draws a blue line from (58, 186) to (196, 113).
; PLAN: r0=58(x1), r1=186(y1), r2=196(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 186
LDI r2, 196
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
