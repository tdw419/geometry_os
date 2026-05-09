; DESCRIPTION: Renders a cyan line between points (462, 51) and (319, 21).
; PLAN: r0=462(x1), r1=51(y1), r2=319(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 51
LDI r2, 319
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
