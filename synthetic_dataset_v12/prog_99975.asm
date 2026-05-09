; DESCRIPTION: Composite: Sets a single magenta pixel at (360, 185) then Renders a green line between points (384, 81) and (125, 95) then Places a magenta 40x12 rectangle at position (341, 34).
; PLAN: r0=360(x), r1=185(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=384(x1), r6=81(y1), r7=125(x2), r8=95(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=34(y), r12=40(width), r13=12(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 185
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 384
LDI r6, 81
LDI r7, 125
LDI r8, 95
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 34
LDI r12, 40
LDI r13, 12
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
