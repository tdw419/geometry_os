; DESCRIPTION: Renders a cyan line between points (332, 246) and (286, 200).
; PLAN: r0=332(x1), r1=246(y1), r2=286(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 246
LDI r2, 286
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
