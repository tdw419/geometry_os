; DESCRIPTION: Draws a white line from (81, 197) to (395, 36).
; PLAN: r0=81(x1), r1=197(y1), r2=395(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 197
LDI r2, 395
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
