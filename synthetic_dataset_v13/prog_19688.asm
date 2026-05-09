; DESCRIPTION: Draws a white line from (372, 113) to (230, 39).
; PLAN: r0=372(x1), r1=113(y1), r2=230(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 113
LDI r2, 230
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
