; DESCRIPTION: Draws a black line from (326, 209) to (285, 183).
; PLAN: r0=326(x1), r1=209(y1), r2=285(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 209
LDI r2, 285
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
