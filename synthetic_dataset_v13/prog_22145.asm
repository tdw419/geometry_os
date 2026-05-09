; DESCRIPTION: Renders a cyan line between points (62, 174) and (353, 117).
; PLAN: r0=62(x1), r1=174(y1), r2=353(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 174
LDI r2, 353
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
