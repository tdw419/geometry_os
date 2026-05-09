; DESCRIPTION: Places a orange line segment connecting (75, 213) to (24, 187).
; PLAN: r0=75(x1), r1=213(y1), r2=24(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 213
LDI r2, 24
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
