; DESCRIPTION: Composite: Places a yellow dot at position (443, 22) then Places a magenta 43x88 rectangle at position (278, 92) then Renders a black line between points (493, 68) and (124, 0).
; PLAN: r0=443(x), r1=22(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=92(y), r7=43(width), r8=88(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=493(x1), r11=68(y1), r12=124(x2), r13=0(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 443
LDI r1, 22
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 278
LDI r6, 92
LDI r7, 43
LDI r8, 88
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 493
LDI r11, 68
LDI r12, 124
LDI r13, 0
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
