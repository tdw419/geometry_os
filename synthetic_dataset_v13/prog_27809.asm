; DESCRIPTION: Renders a white line between points (482, 135) and (301, 142).
; PLAN: r0=482(x1), r1=135(y1), r2=301(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 135
LDI r2, 301
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
