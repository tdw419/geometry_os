; DESCRIPTION: Composite: Sets a single cyan pixel at (213, 58) then Renders a blue line between points (277, 64) and (376, 155) then Renders a blue box of size 40x95 starting at (109, 72).
; PLAN: r0=213(x), r1=58(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=277(x1), r6=64(y1), r7=376(x2), r8=155(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=109(x), r11=72(y), r12=40(width), r13=95(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 58
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 277
LDI r6, 64
LDI r7, 376
LDI r8, 155
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 109
LDI r11, 72
LDI r12, 40
LDI r13, 95
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
