; DESCRIPTION: Renders a green line between points (106, 141) and (477, 213).
; PLAN: r0=106(x1), r1=141(y1), r2=477(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 141
LDI r2, 477
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
