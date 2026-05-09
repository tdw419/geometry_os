; DESCRIPTION: Draws a cyan line from (113, 156) to (478, 211).
; PLAN: r0=113(x1), r1=156(y1), r2=478(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 156
LDI r2, 478
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
