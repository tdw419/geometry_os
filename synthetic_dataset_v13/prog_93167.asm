; DESCRIPTION: Renders a black line between points (157, 35) and (198, 171).
; PLAN: r0=157(x1), r1=35(y1), r2=198(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 35
LDI r2, 198
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
