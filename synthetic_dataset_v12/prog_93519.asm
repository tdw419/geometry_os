; DESCRIPTION: Renders a green line between points (214, 237) and (49, 203).
; PLAN: r0=214(x1), r1=237(y1), r2=49(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 237
LDI r2, 49
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
