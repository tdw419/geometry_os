; DESCRIPTION: Renders a purple line between points (273, 209) and (87, 42).
; PLAN: r0=273(x1), r1=209(y1), r2=87(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 209
LDI r2, 87
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
