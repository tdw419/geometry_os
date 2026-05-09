; DESCRIPTION: Draws a white line from (498, 86) to (230, 39).
; PLAN: r0=498(x1), r1=86(y1), r2=230(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 86
LDI r2, 230
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
