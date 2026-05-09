; DESCRIPTION: Renders a cyan line between points (17, 114) and (195, 250).
; PLAN: r0=17(x1), r1=114(y1), r2=195(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 114
LDI r2, 195
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
