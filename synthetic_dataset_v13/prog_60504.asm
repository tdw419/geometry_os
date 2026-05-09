; DESCRIPTION: Renders a orange line between points (255, 220) and (487, 36).
; PLAN: r0=255(x1), r1=220(y1), r2=487(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 220
LDI r2, 487
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
