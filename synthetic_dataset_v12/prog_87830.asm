; DESCRIPTION: Draws a black line from (375, 230) to (440, 166).
; PLAN: r0=375(x1), r1=230(y1), r2=440(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 230
LDI r2, 440
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
