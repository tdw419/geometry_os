; DESCRIPTION: Renders a orange line between points (130, 154) and (485, 171).
; PLAN: r0=130(x1), r1=154(y1), r2=485(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 154
LDI r2, 485
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
