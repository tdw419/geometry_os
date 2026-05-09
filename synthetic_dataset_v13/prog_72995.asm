; DESCRIPTION: Renders a black line between points (66, 161) and (360, 174).
; PLAN: r0=66(x1), r1=161(y1), r2=360(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 161
LDI r2, 360
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
