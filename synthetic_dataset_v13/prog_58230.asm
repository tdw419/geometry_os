; DESCRIPTION: Renders a black line between points (438, 7) and (82, 173).
; PLAN: r0=438(x1), r1=7(y1), r2=82(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 7
LDI r2, 82
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
