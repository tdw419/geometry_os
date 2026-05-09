; DESCRIPTION: Renders a cyan line between points (315, 96) and (6, 11).
; PLAN: r0=315(x1), r1=96(y1), r2=6(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 96
LDI r2, 6
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
