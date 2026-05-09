; DESCRIPTION: Renders a cyan line between points (163, 20) and (90, 63).
; PLAN: r0=163(x1), r1=20(y1), r2=90(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 20
LDI r2, 90
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
