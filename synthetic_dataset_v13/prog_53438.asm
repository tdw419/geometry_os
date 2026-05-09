; DESCRIPTION: Draws a magenta line from (360, 110) to (497, 27).
; PLAN: r0=360(x1), r1=110(y1), r2=497(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 110
LDI r2, 497
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
