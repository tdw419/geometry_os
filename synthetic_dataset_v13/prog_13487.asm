; DESCRIPTION: Composite: Places a black dot at position (99, 243) then Places a red circle of radius 50 at center (415, 158) then Places a red 24x99 rectangle at position (427, 152).
; PLAN: r0=99(x), r1=243(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=158(y), r7=50(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=427(x), r11=152(y), r12=24(width), r13=99(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 99
LDI r1, 243
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 415
LDI r6, 158
LDI r7, 50
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 427
LDI r11, 152
LDI r12, 24
LDI r13, 99
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
