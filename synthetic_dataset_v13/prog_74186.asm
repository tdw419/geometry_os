; DESCRIPTION: Draws a black line from (309, 125) to (234, 3).
; PLAN: r0=309(x1), r1=125(y1), r2=234(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 125
LDI r2, 234
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
