; DESCRIPTION: Draws a blue line from (488, 151) to (290, 36).
; PLAN: r0=488(x1), r1=151(y1), r2=290(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 151
LDI r2, 290
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
