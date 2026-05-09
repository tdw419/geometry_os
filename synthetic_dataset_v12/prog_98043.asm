; DESCRIPTION: Draws a white line from (492, 27) to (230, 101).
; PLAN: r0=492(x1), r1=27(y1), r2=230(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 27
LDI r2, 230
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
