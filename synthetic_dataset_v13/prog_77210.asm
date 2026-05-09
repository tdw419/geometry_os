; DESCRIPTION: Renders a black line between points (215, 163) and (35, 68).
; PLAN: r0=215(x1), r1=163(y1), r2=35(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 163
LDI r2, 35
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
