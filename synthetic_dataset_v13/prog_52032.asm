; DESCRIPTION: Renders a purple line between points (152, 141) and (42, 134).
; PLAN: r0=152(x1), r1=141(y1), r2=42(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 141
LDI r2, 42
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
