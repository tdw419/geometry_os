; DESCRIPTION: Draws a white line from (356, 133) to (239, 35).
; PLAN: r0=356(x1), r1=133(y1), r2=239(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 133
LDI r2, 239
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
