; DESCRIPTION: Draws a white line from (388, 166) to (492, 48).
; PLAN: r0=388(x1), r1=166(y1), r2=492(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 166
LDI r2, 492
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
