; DESCRIPTION: Draws a white line from (250, 239) to (244, 25).
; PLAN: r0=250(x1), r1=239(y1), r2=244(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 239
LDI r2, 244
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
