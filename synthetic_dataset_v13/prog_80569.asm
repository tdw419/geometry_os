; DESCRIPTION: Renders a white line between points (485, 48) and (110, 173).
; PLAN: r0=485(x1), r1=48(y1), r2=110(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 48
LDI r2, 110
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
