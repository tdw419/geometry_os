; DESCRIPTION: Composite: Places a purple dot at position (425, 146) then Renders a white line between points (257, 75) and (73, 244) then Renders a yellow box of size 107x102 starting at (339, 124).
; PLAN: r0=425(x), r1=146(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=257(x1), r6=75(y1), r7=73(x2), r8=244(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=339(x), r11=124(y), r12=107(width), r13=102(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 425
LDI r1, 146
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 257
LDI r6, 75
LDI r7, 73
LDI r8, 244
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 124
LDI r12, 107
LDI r13, 102
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
