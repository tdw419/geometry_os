; DESCRIPTION: Renders a purple line between points (268, 239) and (299, 199).
; PLAN: r0=268(x1), r1=239(y1), r2=299(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 239
LDI r2, 299
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
