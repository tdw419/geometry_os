; DESCRIPTION: Draws a white line from (295, 69) to (451, 0).
; PLAN: r0=295(x1), r1=69(y1), r2=451(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 69
LDI r2, 451
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
