; DESCRIPTION: Renders a black line between points (436, 116) and (485, 27).
; PLAN: r0=436(x1), r1=116(y1), r2=485(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 116
LDI r2, 485
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
