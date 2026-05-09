; DESCRIPTION: Composite: Renders a red line between points (173, 223) and (399, 131) then Sets a single green pixel at (297, 107) then Draws a magenta rectangle at (120, 2) with width 71 and height 111.
; PLAN: r0=173(x1), r1=223(y1), r2=399(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=107(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=120(x), r11=2(y), r12=71(width), r13=111(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 223
LDI r2, 399
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 107
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 120
LDI r11, 2
LDI r12, 71
LDI r13, 111
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
