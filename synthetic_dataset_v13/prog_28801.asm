; DESCRIPTION: Renders a green line between points (175, 83) and (443, 174).
; PLAN: r0=175(x1), r1=83(y1), r2=443(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 83
LDI r2, 443
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
