; DESCRIPTION: Composite: Places a cyan circle of radius 65 at center (143, 114) then Draws a yellow rectangle at (182, 111) with width 92 and height 37 then Places a red line segment connecting (107, 249) to (407, 6).
; PLAN: r0=143(x), r1=114(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x), r6=111(y), r7=92(width), r8=37(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=107(x1), r11=249(y1), r12=407(x2), r13=6(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 114
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 111
LDI r7, 92
LDI r8, 37
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 249
LDI r12, 407
LDI r13, 6
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
