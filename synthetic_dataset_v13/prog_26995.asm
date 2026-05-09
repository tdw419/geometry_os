; DESCRIPTION: Renders a cyan line between points (254, 155) and (90, 241).
; PLAN: r0=254(x1), r1=155(y1), r2=90(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 155
LDI r2, 90
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
