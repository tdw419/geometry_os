; DESCRIPTION: Draws a white line from (375, 82) to (347, 29).
; PLAN: r0=375(x1), r1=82(y1), r2=347(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 82
LDI r2, 347
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
