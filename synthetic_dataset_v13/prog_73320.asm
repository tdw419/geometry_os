; DESCRIPTION: Draws a cyan line from (60, 17) to (136, 124).
; PLAN: r0=60(x1), r1=17(y1), r2=136(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 17
LDI r2, 136
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
