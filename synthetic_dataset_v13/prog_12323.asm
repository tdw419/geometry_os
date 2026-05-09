; DESCRIPTION: Draws a orange line from (356, 167) to (384, 68).
; PLAN: r0=356(x1), r1=167(y1), r2=384(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 167
LDI r2, 384
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
