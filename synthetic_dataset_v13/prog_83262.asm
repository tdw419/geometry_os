; DESCRIPTION: Renders a cyan line between points (90, 18) and (97, 1).
; PLAN: r0=90(x1), r1=18(y1), r2=97(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 18
LDI r2, 97
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
