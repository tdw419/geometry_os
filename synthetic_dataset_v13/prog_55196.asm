; DESCRIPTION: Composite: Renders a blue box of size 17x42 starting at (227, 74) then Renders a white line between points (454, 47) and (277, 29) then Sets a single black pixel at (299, 180).
; PLAN: r0=227(x), r1=74(y), r2=17(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x1), r6=47(y1), r7=277(x2), r8=29(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=299(x), r11=180(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 227
LDI r1, 74
LDI r2, 17
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 47
LDI r7, 277
LDI r8, 29
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 180
LDI r12, 0x000000
PSET r10, r11, r12
HALT
