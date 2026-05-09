; DESCRIPTION: Renders a black line between points (365, 230) and (416, 134).
; PLAN: r0=365(x1), r1=230(y1), r2=416(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 230
LDI r2, 416
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
