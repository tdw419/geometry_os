; DESCRIPTION: Draws a white line from (239, 64) to (153, 130).
; PLAN: r0=239(x1), r1=64(y1), r2=153(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 64
LDI r2, 153
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
