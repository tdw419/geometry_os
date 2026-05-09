; DESCRIPTION: Renders a red line between points (195, 101) and (442, 239).
; PLAN: r0=195(x1), r1=101(y1), r2=442(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 101
LDI r2, 442
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
