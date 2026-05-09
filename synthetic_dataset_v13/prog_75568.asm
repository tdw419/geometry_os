; DESCRIPTION: Renders a cyan line between points (485, 203) and (310, 100).
; PLAN: r0=485(x1), r1=203(y1), r2=310(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 203
LDI r2, 310
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
