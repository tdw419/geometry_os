; DESCRIPTION: Renders a cyan line between points (212, 109) and (454, 21).
; PLAN: r0=212(x1), r1=109(y1), r2=454(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 109
LDI r2, 454
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
