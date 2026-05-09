; DESCRIPTION: Renders a orange line between points (113, 178) and (256, 25).
; PLAN: r0=113(x1), r1=178(y1), r2=256(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 178
LDI r2, 256
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
