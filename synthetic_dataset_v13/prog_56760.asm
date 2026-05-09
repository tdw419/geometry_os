; DESCRIPTION: Draws a blue line from (313, 125) to (298, 43).
; PLAN: r0=313(x1), r1=125(y1), r2=298(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 125
LDI r2, 298
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
