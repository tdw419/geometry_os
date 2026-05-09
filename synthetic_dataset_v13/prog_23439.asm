; DESCRIPTION: Renders a red line between points (416, 67) and (500, 161).
; PLAN: r0=416(x1), r1=67(y1), r2=500(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 67
LDI r2, 500
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
