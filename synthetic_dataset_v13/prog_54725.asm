; DESCRIPTION: Draws a white line from (482, 22) to (279, 102).
; PLAN: r0=482(x1), r1=22(y1), r2=279(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 22
LDI r2, 279
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
