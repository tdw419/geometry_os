; DESCRIPTION: Composite: Sets a single green pixel at (168, 215) then Renders a white disk with center (248, 179) and radius 69 then Renders a magenta line between points (235, 113) and (93, 171).
; PLAN: r0=168(x), r1=215(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=248(x), r6=179(y), r7=69(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=235(x1), r11=113(y1), r12=93(x2), r13=171(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 215
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 248
LDI r6, 179
LDI r7, 69
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 235
LDI r11, 113
LDI r12, 93
LDI r13, 171
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
