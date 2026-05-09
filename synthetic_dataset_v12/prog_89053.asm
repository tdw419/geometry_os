; DESCRIPTION: Renders a cyan line between points (508, 219) and (296, 27).
; PLAN: r0=508(x1), r1=219(y1), r2=296(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 219
LDI r2, 296
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
