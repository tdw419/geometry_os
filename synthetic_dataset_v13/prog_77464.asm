; DESCRIPTION: Renders a white line between points (156, 72) and (462, 134).
; PLAN: r0=156(x1), r1=72(y1), r2=462(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 72
LDI r2, 462
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
