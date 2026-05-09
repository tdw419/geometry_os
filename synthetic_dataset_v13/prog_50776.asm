; DESCRIPTION: Renders a white line between points (232, 153) and (284, 130).
; PLAN: r0=232(x1), r1=153(y1), r2=284(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 153
LDI r2, 284
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
