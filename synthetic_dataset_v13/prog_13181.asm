; DESCRIPTION: Composite: Sets a single black pixel at (71, 115) then Renders a black box of size 38x89 starting at (264, 63) then Renders a red line between points (358, 26) and (61, 227).
; PLAN: r0=71(x), r1=115(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=264(x), r6=63(y), r7=38(width), r8=89(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=358(x1), r11=26(y1), r12=61(x2), r13=227(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 71
LDI r1, 115
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 264
LDI r6, 63
LDI r7, 38
LDI r8, 89
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 26
LDI r12, 61
LDI r13, 227
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
