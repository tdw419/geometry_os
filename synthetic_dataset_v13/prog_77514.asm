; DESCRIPTION: Draws a white line from (199, 73) to (21, 94).
; PLAN: r0=199(x1), r1=73(y1), r2=21(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 73
LDI r2, 21
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
