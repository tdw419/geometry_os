; DESCRIPTION: Renders a green line between points (261, 43) and (317, 186).
; PLAN: r0=261(x1), r1=43(y1), r2=317(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 43
LDI r2, 317
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
