; DESCRIPTION: Draws a orange line from (74, 86) to (384, 64).
; PLAN: r0=74(x1), r1=86(y1), r2=384(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 86
LDI r2, 384
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
