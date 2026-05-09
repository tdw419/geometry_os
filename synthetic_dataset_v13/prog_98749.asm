; DESCRIPTION: Renders a orange line between points (245, 231) and (256, 38).
; PLAN: r0=245(x1), r1=231(y1), r2=256(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 231
LDI r2, 256
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
