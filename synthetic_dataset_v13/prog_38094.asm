; DESCRIPTION: Renders a white line between points (183, 250) and (317, 167).
; PLAN: r0=183(x1), r1=250(y1), r2=317(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 250
LDI r2, 317
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
