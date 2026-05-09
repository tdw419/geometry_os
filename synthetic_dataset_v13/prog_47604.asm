; DESCRIPTION: Draws a black line from (205, 98) to (70, 2).
; PLAN: r0=205(x1), r1=98(y1), r2=70(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 98
LDI r2, 70
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
