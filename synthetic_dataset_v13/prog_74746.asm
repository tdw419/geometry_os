; DESCRIPTION: Composite: Places a black dot at position (83, 24) then Renders a red box of size 21x83 starting at (196, 44) then Renders a orange line between points (197, 146) and (115, 67).
; PLAN: r0=83(x), r1=24(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=196(x), r6=44(y), r7=21(width), r8=83(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=197(x1), r11=146(y1), r12=115(x2), r13=67(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 83
LDI r1, 24
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 196
LDI r6, 44
LDI r7, 21
LDI r8, 83
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 146
LDI r12, 115
LDI r13, 67
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
