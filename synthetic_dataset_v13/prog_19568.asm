; DESCRIPTION: Renders a orange line between points (183, 197) and (288, 198).
; PLAN: r0=183(x1), r1=197(y1), r2=288(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 197
LDI r2, 288
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
