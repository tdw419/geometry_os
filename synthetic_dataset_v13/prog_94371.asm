; DESCRIPTION: Composite: Renders a yellow disk with center (424, 107) and radius 49 then Renders a cyan box of size 50x28 starting at (277, 145) then Renders a orange line between points (346, 170) and (343, 148).
; PLAN: r0=424(x), r1=107(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=277(x), r6=145(y), r7=50(width), r8=28(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x1), r11=170(y1), r12=343(x2), r13=148(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 107
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 277
LDI r6, 145
LDI r7, 50
LDI r8, 28
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 170
LDI r12, 343
LDI r13, 148
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
