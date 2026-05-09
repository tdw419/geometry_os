; DESCRIPTION: Renders a black line between points (294, 107) and (15, 12).
; PLAN: r0=294(x1), r1=107(y1), r2=15(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 107
LDI r2, 15
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
