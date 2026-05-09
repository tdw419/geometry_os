; DESCRIPTION: Renders a orange line between points (434, 236) and (327, 9).
; PLAN: r0=434(x1), r1=236(y1), r2=327(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 236
LDI r2, 327
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
