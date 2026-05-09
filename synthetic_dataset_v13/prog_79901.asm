; DESCRIPTION: Renders a cyan line between points (276, 148) and (310, 106).
; PLAN: r0=276(x1), r1=148(y1), r2=310(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 148
LDI r2, 310
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
