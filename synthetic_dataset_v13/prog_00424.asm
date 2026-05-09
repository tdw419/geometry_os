; DESCRIPTION: Draws a black line from (77, 254) to (174, 103).
; PLAN: r0=77(x1), r1=254(y1), r2=174(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 254
LDI r2, 174
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
