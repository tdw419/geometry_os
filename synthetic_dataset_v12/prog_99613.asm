; DESCRIPTION: Composite: Renders a red disk with center (434, 114) and radius 35 then Renders a cyan line between points (235, 146) and (212, 152) then Draws a magenta rectangle at (374, 131) with width 103 and height 73.
; PLAN: r0=434(x), r1=114(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x1), r6=146(y1), r7=212(x2), r8=152(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=374(x), r11=131(y), r12=103(width), r13=73(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 114
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 146
LDI r7, 212
LDI r8, 152
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 131
LDI r12, 103
LDI r13, 73
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
