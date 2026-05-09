; DESCRIPTION: Renders a cyan line between points (151, 245) and (44, 90).
; PLAN: r0=151(x1), r1=245(y1), r2=44(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 245
LDI r2, 44
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
