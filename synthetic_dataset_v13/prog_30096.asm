; DESCRIPTION: Draws a white line from (367, 39) to (160, 212).
; PLAN: r0=367(x1), r1=39(y1), r2=160(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 39
LDI r2, 160
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
