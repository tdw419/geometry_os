; DESCRIPTION: Renders a cyan line between points (19, 45) and (500, 232).
; PLAN: r0=19(x1), r1=45(y1), r2=500(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 45
LDI r2, 500
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
