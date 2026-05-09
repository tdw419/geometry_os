; DESCRIPTION: Draws a white line from (354, 206) to (493, 118).
; PLAN: r0=354(x1), r1=206(y1), r2=493(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 206
LDI r2, 493
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
