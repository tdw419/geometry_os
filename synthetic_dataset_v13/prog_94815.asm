; DESCRIPTION: Renders a cyan line between points (130, 175) and (351, 127).
; PLAN: r0=130(x1), r1=175(y1), r2=351(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 175
LDI r2, 351
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
