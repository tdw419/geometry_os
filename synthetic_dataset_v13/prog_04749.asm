; DESCRIPTION: Draws a green line from (199, 199) to (327, 107).
; PLAN: r0=199(x1), r1=199(y1), r2=327(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 199
LDI r2, 327
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
