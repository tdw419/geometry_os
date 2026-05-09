; DESCRIPTION: Renders a purple line between points (300, 46) and (215, 42).
; PLAN: r0=300(x1), r1=46(y1), r2=215(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 46
LDI r2, 215
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
