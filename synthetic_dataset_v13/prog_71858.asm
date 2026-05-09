; DESCRIPTION: Draws a white line from (266, 205) to (53, 91).
; PLAN: r0=266(x1), r1=205(y1), r2=53(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 205
LDI r2, 53
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
