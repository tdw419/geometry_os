; DESCRIPTION: Composite: Places a red dot at position (269, 44) then Draws a magenta line from (298, 208) to (388, 137) then Draws a black rectangle at (354, 30) with width 15 and height 113.
; PLAN: r0=269(x), r1=44(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=298(x1), r6=208(y1), r7=388(x2), r8=137(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=354(x), r11=30(y), r12=15(width), r13=113(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 269
LDI r1, 44
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 298
LDI r6, 208
LDI r7, 388
LDI r8, 137
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 30
LDI r12, 15
LDI r13, 113
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
