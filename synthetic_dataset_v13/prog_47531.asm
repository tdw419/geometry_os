; DESCRIPTION: Renders a green line between points (410, 190) and (97, 245).
; PLAN: r0=410(x1), r1=190(y1), r2=97(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 190
LDI r2, 97
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
