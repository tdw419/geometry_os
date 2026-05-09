; DESCRIPTION: Composite: Places a red dot at position (290, 217) then Renders a yellow line between points (20, 198) and (213, 147) then Places a white 65x92 rectangle at position (262, 22).
; PLAN: r0=290(x), r1=217(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=20(x1), r6=198(y1), r7=213(x2), r8=147(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=262(x), r11=22(y), r12=65(width), r13=92(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 290
LDI r1, 217
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 20
LDI r6, 198
LDI r7, 213
LDI r8, 147
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 22
LDI r12, 65
LDI r13, 92
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
