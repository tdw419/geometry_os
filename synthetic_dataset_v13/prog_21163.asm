; DESCRIPTION: Renders a orange line between points (391, 170) and (401, 228).
; PLAN: r0=391(x1), r1=170(y1), r2=401(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 170
LDI r2, 401
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
