; DESCRIPTION: Composite: Places a blue dot at position (298, 194) then Draws a red line from (131, 173) to (52, 216) then Draws a blue rectangle at (339, 30) with width 87 and height 37.
; PLAN: r0=298(x), r1=194(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=131(x1), r6=173(y1), r7=52(x2), r8=216(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=339(x), r11=30(y), r12=87(width), r13=37(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 298
LDI r1, 194
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 131
LDI r6, 173
LDI r7, 52
LDI r8, 216
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 30
LDI r12, 87
LDI r13, 37
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
