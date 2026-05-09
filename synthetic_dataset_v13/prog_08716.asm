; DESCRIPTION: Renders a cyan line between points (485, 1) and (210, 188).
; PLAN: r0=485(x1), r1=1(y1), r2=210(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 1
LDI r2, 210
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
