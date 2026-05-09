; DESCRIPTION: Composite: Places a cyan dot at position (8, 196) then Renders a white line between points (237, 104) and (262, 111) then Draws a red rectangle at (476, 34) with width 24 and height 33.
; PLAN: r0=8(x), r1=196(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=237(x1), r6=104(y1), r7=262(x2), r8=111(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=476(x), r11=34(y), r12=24(width), r13=33(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 8
LDI r1, 196
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 237
LDI r6, 104
LDI r7, 262
LDI r8, 111
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 476
LDI r11, 34
LDI r12, 24
LDI r13, 33
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
