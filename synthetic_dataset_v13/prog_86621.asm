; DESCRIPTION: Renders a yellow line between points (284, 137) and (212, 0).
; PLAN: r0=284(x1), r1=137(y1), r2=212(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 137
LDI r2, 212
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
