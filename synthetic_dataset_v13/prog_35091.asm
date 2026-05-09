; DESCRIPTION: Renders a yellow line between points (485, 248) and (474, 203).
; PLAN: r0=485(x1), r1=248(y1), r2=474(x2), r3=203(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 248
LDI r2, 474
LDI r3, 203
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
