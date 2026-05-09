; DESCRIPTION: Renders a red line between points (485, 214) and (175, 250).
; PLAN: r0=485(x1), r1=214(y1), r2=175(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 214
LDI r2, 175
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
