; DESCRIPTION: Places a orange line segment connecting (81, 228) to (25, 164).
; PLAN: r0=81(x1), r1=228(y1), r2=25(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 228
LDI r2, 25
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
