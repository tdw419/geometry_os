; DESCRIPTION: Composite: Places a yellow dot at position (50, 180) then Draws a yellow line from (506, 107) to (330, 245) then Draws a black rectangle at (54, 162) with width 80 and height 86.
; PLAN: r0=50(x), r1=180(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=506(x1), r6=107(y1), r7=330(x2), r8=245(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=54(x), r11=162(y), r12=80(width), r13=86(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 50
LDI r1, 180
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 506
LDI r6, 107
LDI r7, 330
LDI r8, 245
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 162
LDI r12, 80
LDI r13, 86
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
