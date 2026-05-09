; DESCRIPTION: Draws a black line from (482, 171) to (120, 251).
; PLAN: r0=482(x1), r1=171(y1), r2=120(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 171
LDI r2, 120
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
