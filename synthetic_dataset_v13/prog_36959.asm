; DESCRIPTION: Draws a black line from (199, 180) to (220, 144).
; PLAN: r0=199(x1), r1=180(y1), r2=220(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 180
LDI r2, 220
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
