; DESCRIPTION: Draws a black line from (60, 37) to (433, 76).
; PLAN: r0=60(x1), r1=37(y1), r2=433(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 37
LDI r2, 433
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
