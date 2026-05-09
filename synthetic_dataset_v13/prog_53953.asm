; DESCRIPTION: Renders a green line between points (408, 139) and (372, 125).
; PLAN: r0=408(x1), r1=139(y1), r2=372(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 139
LDI r2, 372
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
