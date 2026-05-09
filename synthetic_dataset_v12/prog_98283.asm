; DESCRIPTION: Renders a orange line between points (393, 195) and (72, 69).
; PLAN: r0=393(x1), r1=195(y1), r2=72(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 195
LDI r2, 72
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
