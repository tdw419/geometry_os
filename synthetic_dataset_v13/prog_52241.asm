; DESCRIPTION: Composite: Places a red dot at position (262, 3) then Renders a purple line between points (299, 173) and (199, 96) then Places a red 69x17 rectangle at position (54, 72).
; PLAN: r0=262(x), r1=3(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=299(x1), r6=173(y1), r7=199(x2), r8=96(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=54(x), r11=72(y), r12=69(width), r13=17(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 3
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 299
LDI r6, 173
LDI r7, 199
LDI r8, 96
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 72
LDI r12, 69
LDI r13, 17
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
