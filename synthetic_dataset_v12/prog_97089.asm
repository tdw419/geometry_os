; DESCRIPTION: Renders a black line between points (416, 246) and (492, 30).
; PLAN: r0=416(x1), r1=246(y1), r2=492(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 246
LDI r2, 492
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
