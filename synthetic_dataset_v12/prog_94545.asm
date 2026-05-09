; DESCRIPTION: Renders a white line between points (481, 108) and (340, 162).
; PLAN: r0=481(x1), r1=108(y1), r2=340(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 108
LDI r2, 340
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
