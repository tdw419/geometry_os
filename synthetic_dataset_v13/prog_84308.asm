; DESCRIPTION: Draws a black line from (206, 254) to (275, 183).
; PLAN: r0=206(x1), r1=254(y1), r2=275(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 254
LDI r2, 275
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
