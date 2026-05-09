; DESCRIPTION: Draws a black line from (87, 245) to (233, 166).
; PLAN: r0=87(x1), r1=245(y1), r2=233(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 245
LDI r2, 233
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
