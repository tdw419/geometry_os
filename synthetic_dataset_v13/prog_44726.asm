; DESCRIPTION: Renders a black line between points (15, 173) and (95, 57).
; PLAN: r0=15(x1), r1=173(y1), r2=95(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 173
LDI r2, 95
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
