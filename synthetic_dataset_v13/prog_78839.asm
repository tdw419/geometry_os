; DESCRIPTION: Renders a green line between points (150, 190) and (90, 37).
; PLAN: r0=150(x1), r1=190(y1), r2=90(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 190
LDI r2, 90
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
