; DESCRIPTION: Renders a cyan line between points (347, 213) and (232, 18).
; PLAN: r0=347(x1), r1=213(y1), r2=232(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 213
LDI r2, 232
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
