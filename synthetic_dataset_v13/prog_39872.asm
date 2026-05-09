; DESCRIPTION: Renders a purple line between points (103, 56) and (284, 97).
; PLAN: r0=103(x1), r1=56(y1), r2=284(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 56
LDI r2, 284
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
