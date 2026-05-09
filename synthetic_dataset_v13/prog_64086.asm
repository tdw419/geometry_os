; DESCRIPTION: Composite: Renders a green line between points (229, 105) and (83, 235) then Creates a green rectangular region at (151, 126) spanning 60 by 113 pixels then Places a yellow dot at position (168, 216).
; PLAN: r0=229(x1), r1=105(y1), r2=83(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=126(y), r7=60(width), r8=113(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=168(x), r11=216(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 229
LDI r1, 105
LDI r2, 83
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 126
LDI r7, 60
LDI r8, 113
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 168
LDI r11, 216
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
