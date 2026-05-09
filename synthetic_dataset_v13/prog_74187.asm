; DESCRIPTION: Draws a white line from (240, 240) to (52, 26).
; PLAN: r0=240(x1), r1=240(y1), r2=52(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 240
LDI r2, 52
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
