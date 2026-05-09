; DESCRIPTION: Renders a orange line between points (406, 230) and (315, 164).
; PLAN: r0=406(x1), r1=230(y1), r2=315(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 230
LDI r2, 315
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
