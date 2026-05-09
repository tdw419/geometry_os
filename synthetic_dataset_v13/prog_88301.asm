; DESCRIPTION: Draws a orange line from (172, 228) to (384, 138).
; PLAN: r0=172(x1), r1=228(y1), r2=384(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 228
LDI r2, 384
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
