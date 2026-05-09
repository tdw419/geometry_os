; DESCRIPTION: Composite: Places a yellow dot at position (504, 59) then Renders a yellow box of size 48x97 starting at (442, 13) then Draws a black line from (486, 131) to (237, 184).
; PLAN: r0=504(x), r1=59(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=442(x), r6=13(y), r7=48(width), r8=97(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=486(x1), r11=131(y1), r12=237(x2), r13=184(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 504
LDI r1, 59
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 442
LDI r6, 13
LDI r7, 48
LDI r8, 97
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 486
LDI r11, 131
LDI r12, 237
LDI r13, 184
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
