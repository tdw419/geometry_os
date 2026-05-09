; DESCRIPTION: Composite: Places a orange 55x92 rectangle at position (1, 95) then Sets a single black pixel at (115, 12) then Renders a red line between points (299, 48) and (281, 67).
; PLAN: r0=1(x), r1=95(y), r2=55(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=115(x), r6=12(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=299(x1), r11=48(y1), r12=281(x2), r13=67(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 1
LDI r1, 95
LDI r2, 55
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 12
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 299
LDI r11, 48
LDI r12, 281
LDI r13, 67
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
