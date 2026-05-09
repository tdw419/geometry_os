; DESCRIPTION: Renders a white line between points (113, 174) and (425, 32).
; PLAN: r0=113(x1), r1=174(y1), r2=425(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 174
LDI r2, 425
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
