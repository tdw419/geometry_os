; DESCRIPTION: Renders a black line between points (504, 125) and (215, 252).
; PLAN: r0=504(x1), r1=125(y1), r2=215(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 125
LDI r2, 215
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
