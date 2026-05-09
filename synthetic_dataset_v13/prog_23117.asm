; DESCRIPTION: Draws a white line from (44, 237) to (239, 18).
; PLAN: r0=44(x1), r1=237(y1), r2=239(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 237
LDI r2, 239
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
