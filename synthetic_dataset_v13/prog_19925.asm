; DESCRIPTION: Draws a white line from (230, 39) to (66, 87).
; PLAN: r0=230(x1), r1=39(y1), r2=66(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 39
LDI r2, 66
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
