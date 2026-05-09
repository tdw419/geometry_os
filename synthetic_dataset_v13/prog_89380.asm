; DESCRIPTION: Renders a white line between points (91, 149) and (74, 171).
; PLAN: r0=91(x1), r1=149(y1), r2=74(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 149
LDI r2, 74
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
