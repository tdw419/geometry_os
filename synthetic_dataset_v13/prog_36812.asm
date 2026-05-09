; DESCRIPTION: Renders a black line between points (485, 168) and (150, 11).
; PLAN: r0=485(x1), r1=168(y1), r2=150(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 168
LDI r2, 150
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
