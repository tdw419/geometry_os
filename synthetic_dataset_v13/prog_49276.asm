; DESCRIPTION: Draws a magenta line from (365, 139) to (491, 75).
; PLAN: r0=365(x1), r1=139(y1), r2=491(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 139
LDI r2, 491
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
