; DESCRIPTION: Places a orange line segment connecting (247, 64) to (117, 228).
; PLAN: r0=247(x1), r1=64(y1), r2=117(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 64
LDI r2, 117
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
