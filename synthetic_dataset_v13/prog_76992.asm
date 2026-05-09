; DESCRIPTION: Composite: Renders a blue line between points (267, 133) and (306, 28) then Renders a purple disk with center (477, 224) and radius 13.
; PLAN: r0=267(x1), r1=133(y1), r2=306(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=477(x), r6=224(y), r7=13(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 267
LDI r1, 133
LDI r2, 306
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 224
LDI r7, 13
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
