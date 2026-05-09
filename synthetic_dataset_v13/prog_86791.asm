; DESCRIPTION: Draws a black line from (279, 125) to (33, 44).
; PLAN: r0=279(x1), r1=125(y1), r2=33(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 125
LDI r2, 33
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
