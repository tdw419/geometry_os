; DESCRIPTION: Renders a cyan line between points (278, 86) and (190, 13).
; PLAN: r0=278(x1), r1=86(y1), r2=190(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 86
LDI r2, 190
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
