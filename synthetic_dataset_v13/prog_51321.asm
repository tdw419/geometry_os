; DESCRIPTION: Places a orange line segment connecting (355, 228) to (320, 182).
; PLAN: r0=355(x1), r1=228(y1), r2=320(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 228
LDI r2, 320
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
