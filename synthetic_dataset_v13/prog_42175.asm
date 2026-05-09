; DESCRIPTION: Renders a orange line between points (366, 130) and (475, 213).
; PLAN: r0=366(x1), r1=130(y1), r2=475(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 130
LDI r2, 475
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
