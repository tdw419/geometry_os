; DESCRIPTION: Renders a purple line between points (465, 246) and (284, 132).
; PLAN: r0=465(x1), r1=246(y1), r2=284(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 246
LDI r2, 284
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
