; DESCRIPTION: Draws a yellow line from (488, 110) to (413, 29).
; PLAN: r0=488(x1), r1=110(y1), r2=413(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 110
LDI r2, 413
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
