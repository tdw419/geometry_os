; DESCRIPTION: Draws a cyan line from (136, 125) to (166, 248).
; PLAN: r0=136(x1), r1=125(y1), r2=166(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 125
LDI r2, 166
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
