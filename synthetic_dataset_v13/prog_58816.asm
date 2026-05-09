; DESCRIPTION: Composite: Places a blue 25x41 rectangle at position (316, 88) then Renders a yellow line between points (504, 182) and (405, 3) then Places a yellow dot at position (5, 154).
; PLAN: r0=316(x), r1=88(y), r2=25(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x1), r6=182(y1), r7=405(x2), r8=3(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=5(x), r11=154(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 316
LDI r1, 88
LDI r2, 25
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 182
LDI r7, 405
LDI r8, 3
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 5
LDI r11, 154
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
