; DESCRIPTION: Renders a green line between points (399, 187) and (148, 171).
; PLAN: r0=399(x1), r1=187(y1), r2=148(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 187
LDI r2, 148
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
