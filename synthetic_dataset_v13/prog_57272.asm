; DESCRIPTION: Renders a purple line between points (282, 42) and (412, 143).
; PLAN: r0=282(x1), r1=42(y1), r2=412(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 42
LDI r2, 412
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
