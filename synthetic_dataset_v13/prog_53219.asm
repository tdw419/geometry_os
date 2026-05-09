; DESCRIPTION: Renders a orange line between points (405, 213) and (292, 163).
; PLAN: r0=405(x1), r1=213(y1), r2=292(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 213
LDI r2, 292
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
