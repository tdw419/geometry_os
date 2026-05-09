; DESCRIPTION: Renders a cyan line between points (485, 159) and (206, 144).
; PLAN: r0=485(x1), r1=159(y1), r2=206(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 159
LDI r2, 206
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
