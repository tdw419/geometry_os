; DESCRIPTION: Renders a cyan line between points (51, 65) and (372, 60).
; PLAN: r0=51(x1), r1=65(y1), r2=372(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 65
LDI r2, 372
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
