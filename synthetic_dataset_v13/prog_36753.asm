; DESCRIPTION: Renders a black line between points (42, 78) and (511, 198).
; PLAN: r0=42(x1), r1=78(y1), r2=511(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 78
LDI r2, 511
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
