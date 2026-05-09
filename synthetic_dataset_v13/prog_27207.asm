; DESCRIPTION: Renders a black line between points (456, 91) and (394, 38).
; PLAN: r0=456(x1), r1=91(y1), r2=394(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 91
LDI r2, 394
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
