; DESCRIPTION: Renders a cyan line between points (340, 134) and (181, 248).
; PLAN: r0=340(x1), r1=134(y1), r2=181(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 134
LDI r2, 181
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
