; DESCRIPTION: Draws a white line from (89, 239) to (317, 216).
; PLAN: r0=89(x1), r1=239(y1), r2=317(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 239
LDI r2, 317
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
