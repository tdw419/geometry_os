; DESCRIPTION: Renders a white line between points (458, 60) and (206, 46).
; PLAN: r0=458(x1), r1=60(y1), r2=206(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 60
LDI r2, 206
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
