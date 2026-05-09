; DESCRIPTION: Draws a white line from (313, 170) to (315, 166).
; PLAN: r0=313(x1), r1=170(y1), r2=315(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 170
LDI r2, 315
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
