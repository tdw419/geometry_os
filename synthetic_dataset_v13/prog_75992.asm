; DESCRIPTION: Renders a black line between points (465, 47) and (443, 207).
; PLAN: r0=465(x1), r1=47(y1), r2=443(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 47
LDI r2, 443
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
