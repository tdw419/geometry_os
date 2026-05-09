; DESCRIPTION: Renders a black line between points (294, 90) and (49, 60).
; PLAN: r0=294(x1), r1=90(y1), r2=49(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 90
LDI r2, 49
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
