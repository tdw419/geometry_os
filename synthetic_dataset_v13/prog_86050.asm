; DESCRIPTION: Draws a white line from (199, 237) to (365, 71).
; PLAN: r0=199(x1), r1=237(y1), r2=365(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 237
LDI r2, 365
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
