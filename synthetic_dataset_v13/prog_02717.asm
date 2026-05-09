; DESCRIPTION: Renders a white line between points (161, 67) and (320, 94).
; PLAN: r0=161(x1), r1=67(y1), r2=320(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 67
LDI r2, 320
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
