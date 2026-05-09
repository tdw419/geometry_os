; DESCRIPTION: Draws a black line from (207, 209) to (375, 55).
; PLAN: r0=207(x1), r1=209(y1), r2=375(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 209
LDI r2, 375
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
