; DESCRIPTION: Renders a black line between points (42, 59) and (250, 173).
; PLAN: r0=42(x1), r1=59(y1), r2=250(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 59
LDI r2, 250
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
