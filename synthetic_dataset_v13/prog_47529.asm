; DESCRIPTION: Renders a cyan line between points (424, 15) and (85, 241).
; PLAN: r0=424(x1), r1=15(y1), r2=85(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 15
LDI r2, 85
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
