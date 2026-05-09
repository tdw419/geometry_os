; DESCRIPTION: Draws a yellow line from (436, 107) to (458, 233).
; PLAN: r0=436(x1), r1=107(y1), r2=458(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 107
LDI r2, 458
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
