; DESCRIPTION: Renders a orange line between points (213, 167) and (271, 70).
; PLAN: r0=213(x1), r1=167(y1), r2=271(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 167
LDI r2, 271
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
