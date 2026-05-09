; DESCRIPTION: Renders a white line between points (250, 210) and (218, 134).
; PLAN: r0=250(x1), r1=210(y1), r2=218(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 210
LDI r2, 218
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
