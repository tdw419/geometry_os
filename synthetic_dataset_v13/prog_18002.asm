; DESCRIPTION: Renders a white line between points (249, 205) and (249, 25).
; PLAN: r0=249(x1), r1=205(y1), r2=249(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 205
LDI r2, 249
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
