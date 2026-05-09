; DESCRIPTION: Draws a black line from (407, 233) to (131, 166).
; PLAN: r0=407(x1), r1=233(y1), r2=131(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 233
LDI r2, 131
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
