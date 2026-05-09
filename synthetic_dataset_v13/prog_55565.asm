; DESCRIPTION: Renders a black line between points (380, 246) and (60, 207).
; PLAN: r0=380(x1), r1=246(y1), r2=60(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 246
LDI r2, 60
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
