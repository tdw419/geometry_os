; DESCRIPTION: Draws a magenta line from (383, 235) to (275, 252).
; PLAN: r0=383(x1), r1=235(y1), r2=275(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 235
LDI r2, 275
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
