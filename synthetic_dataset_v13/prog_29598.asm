; DESCRIPTION: Composite: Sets a single green pixel at (136, 4) then Draws a red rectangle at (250, 173) with width 11 and height 81 then Draws a red line from (440, 173) to (284, 57).
; PLAN: r0=136(x), r1=4(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=250(x), r6=173(y), r7=11(width), r8=81(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=440(x1), r11=173(y1), r12=284(x2), r13=57(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 4
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 250
LDI r6, 173
LDI r7, 11
LDI r8, 81
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 440
LDI r11, 173
LDI r12, 284
LDI r13, 57
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
