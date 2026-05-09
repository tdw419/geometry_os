; DESCRIPTION: Composite: Places a black dot at position (165, 251) then Draws a cyan rectangle at (463, 145) with width 32 and height 44 then Renders a white line between points (64, 67) and (44, 50).
; PLAN: r0=165(x), r1=251(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=463(x), r6=145(y), r7=32(width), r8=44(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=64(x1), r11=67(y1), r12=44(x2), r13=50(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 165
LDI r1, 251
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 463
LDI r6, 145
LDI r7, 32
LDI r8, 44
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 67
LDI r12, 44
LDI r13, 50
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
