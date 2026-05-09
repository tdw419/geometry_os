; DESCRIPTION: Draws a white line from (35, 254) to (350, 251).
; PLAN: r0=35(x1), r1=254(y1), r2=350(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 254
LDI r2, 350
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
