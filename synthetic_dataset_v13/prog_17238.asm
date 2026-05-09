; DESCRIPTION: Draws a white line from (279, 107) to (135, 175).
; PLAN: r0=279(x1), r1=107(y1), r2=135(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 107
LDI r2, 135
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
