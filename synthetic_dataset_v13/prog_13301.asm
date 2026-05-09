; DESCRIPTION: Draws a black line from (216, 239) to (334, 82).
; PLAN: r0=216(x1), r1=239(y1), r2=334(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 239
LDI r2, 334
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
