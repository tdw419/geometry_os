; DESCRIPTION: Draws a blue line from (102, 25) to (298, 81).
; PLAN: r0=102(x1), r1=25(y1), r2=298(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 25
LDI r2, 298
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
