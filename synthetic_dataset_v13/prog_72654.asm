; DESCRIPTION: Renders a purple line between points (499, 42) and (38, 73).
; PLAN: r0=499(x1), r1=42(y1), r2=38(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 42
LDI r2, 38
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
