; DESCRIPTION: Renders a cyan line between points (205, 171) and (112, 161).
; PLAN: r0=205(x1), r1=171(y1), r2=112(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 171
LDI r2, 112
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
