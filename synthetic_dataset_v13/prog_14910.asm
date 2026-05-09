; DESCRIPTION: Draws a orange line from (242, 206) to (285, 51).
; PLAN: r0=242(x1), r1=206(y1), r2=285(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 206
LDI r2, 285
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
