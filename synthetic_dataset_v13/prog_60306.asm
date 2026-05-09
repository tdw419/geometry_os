; DESCRIPTION: Draws a black line from (25, 204) to (48, 48).
; PLAN: r0=25(x1), r1=204(y1), r2=48(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 204
LDI r2, 48
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
