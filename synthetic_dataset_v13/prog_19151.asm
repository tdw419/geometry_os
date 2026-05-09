; DESCRIPTION: Draws a black line from (425, 225) to (196, 183).
; PLAN: r0=425(x1), r1=225(y1), r2=196(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 225
LDI r2, 196
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
