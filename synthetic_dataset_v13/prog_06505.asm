; DESCRIPTION: Renders a black line between points (213, 46) and (58, 246).
; PLAN: r0=213(x1), r1=46(y1), r2=58(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 46
LDI r2, 58
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
