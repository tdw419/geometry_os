; DESCRIPTION: Renders a cyan line between points (84, 55) and (485, 233).
; PLAN: r0=84(x1), r1=55(y1), r2=485(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 55
LDI r2, 485
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
