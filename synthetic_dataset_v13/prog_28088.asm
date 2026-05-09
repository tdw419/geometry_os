; DESCRIPTION: Renders a blue line between points (241, 64) and (82, 126).
; PLAN: r0=241(x1), r1=64(y1), r2=82(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 64
LDI r2, 82
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
