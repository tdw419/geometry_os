; DESCRIPTION: Composite: Places a yellow dot at position (492, 42) then Places a red circle of radius 45 at center (205, 184) then Renders a yellow line between points (105, 151) and (426, 238).
; PLAN: r0=492(x), r1=42(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=205(x), r6=184(y), r7=45(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=105(x1), r11=151(y1), r12=426(x2), r13=238(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 492
LDI r1, 42
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 205
LDI r6, 184
LDI r7, 45
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 105
LDI r11, 151
LDI r12, 426
LDI r13, 238
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
