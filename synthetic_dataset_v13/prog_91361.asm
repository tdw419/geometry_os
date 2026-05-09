; DESCRIPTION: Renders a cyan line between points (485, 251) and (418, 225).
; PLAN: r0=485(x1), r1=251(y1), r2=418(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 251
LDI r2, 418
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
