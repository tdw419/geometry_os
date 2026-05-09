; DESCRIPTION: Renders a purple line between points (13, 26) and (284, 15).
; PLAN: r0=13(x1), r1=26(y1), r2=284(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 26
LDI r2, 284
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
