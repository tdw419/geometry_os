; DESCRIPTION: Draws a white line from (56, 139) to (486, 215).
; PLAN: r0=56(x1), r1=139(y1), r2=486(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 139
LDI r2, 486
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
