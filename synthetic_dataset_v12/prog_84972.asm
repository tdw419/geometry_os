; DESCRIPTION: Draws a white line from (218, 55) to (230, 7).
; PLAN: r0=218(x1), r1=55(y1), r2=230(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 55
LDI r2, 230
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
