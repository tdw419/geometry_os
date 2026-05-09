; DESCRIPTION: Renders a green line between points (317, 166) and (11, 183).
; PLAN: r0=317(x1), r1=166(y1), r2=11(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 166
LDI r2, 11
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
