; DESCRIPTION: Draws a white line from (211, 85) to (239, 170).
; PLAN: r0=211(x1), r1=85(y1), r2=239(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 85
LDI r2, 239
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
