; DESCRIPTION: Renders a orange line between points (23, 213) and (64, 240).
; PLAN: r0=23(x1), r1=213(y1), r2=64(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 213
LDI r2, 64
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
