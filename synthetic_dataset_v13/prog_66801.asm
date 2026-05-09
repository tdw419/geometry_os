; DESCRIPTION: Renders a green line between points (76, 220) and (413, 214).
; PLAN: r0=76(x1), r1=220(y1), r2=413(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 220
LDI r2, 413
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
