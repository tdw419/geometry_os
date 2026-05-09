; DESCRIPTION: Renders a orange line between points (317, 255) and (344, 38).
; PLAN: r0=317(x1), r1=255(y1), r2=344(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 255
LDI r2, 344
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
