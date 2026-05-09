; DESCRIPTION: Renders a purple line between points (29, 42) and (290, 28).
; PLAN: r0=29(x1), r1=42(y1), r2=290(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 42
LDI r2, 290
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
