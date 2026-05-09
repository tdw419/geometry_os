; DESCRIPTION: Composite: Places a yellow dot at position (88, 92) then Draws a black line from (269, 72) to (380, 163) then Places a yellow 105x92 rectangle at position (400, 99).
; PLAN: r0=88(x), r1=92(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=269(x1), r6=72(y1), r7=380(x2), r8=163(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=400(x), r11=99(y), r12=105(width), r13=92(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 92
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 269
LDI r6, 72
LDI r7, 380
LDI r8, 163
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 99
LDI r12, 105
LDI r13, 92
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
