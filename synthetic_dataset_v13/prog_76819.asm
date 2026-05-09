; DESCRIPTION: Renders a cyan line between points (485, 184) and (372, 197).
; PLAN: r0=485(x1), r1=184(y1), r2=372(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 184
LDI r2, 372
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
