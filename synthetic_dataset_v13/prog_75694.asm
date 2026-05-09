; DESCRIPTION: Renders a black line between points (154, 158) and (345, 174).
; PLAN: r0=154(x1), r1=158(y1), r2=345(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 158
LDI r2, 345
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
