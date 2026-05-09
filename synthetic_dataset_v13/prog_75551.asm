; DESCRIPTION: Renders a purple line between points (284, 201) and (392, 0).
; PLAN: r0=284(x1), r1=201(y1), r2=392(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 201
LDI r2, 392
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
