; DESCRIPTION: Renders a white line between points (76, 171) and (50, 222).
; PLAN: r0=76(x1), r1=171(y1), r2=50(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 171
LDI r2, 50
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
