; DESCRIPTION: Renders a white line between points (19, 149) and (403, 14).
; PLAN: r0=19(x1), r1=149(y1), r2=403(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 149
LDI r2, 403
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
