; DESCRIPTION: Draws a green line from (230, 39) to (334, 191).
; PLAN: r0=230(x1), r1=39(y1), r2=334(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 39
LDI r2, 334
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
