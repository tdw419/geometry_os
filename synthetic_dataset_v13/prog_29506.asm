; DESCRIPTION: Renders a purple line between points (434, 50) and (344, 44).
; PLAN: r0=434(x1), r1=50(y1), r2=344(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 50
LDI r2, 344
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
