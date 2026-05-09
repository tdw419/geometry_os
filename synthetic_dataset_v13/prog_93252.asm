; DESCRIPTION: Composite: Creates a cyan rectangular region at (421, 211) spanning 29 by 16 pixels then Places a white dot at position (290, 91) then Places a purple line segment connecting (411, 240) to (493, 18).
; PLAN: r0=421(x), r1=211(y), r2=29(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=290(x), r6=91(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=411(x1), r11=240(y1), r12=493(x2), r13=18(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 211
LDI r2, 29
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 91
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 411
LDI r11, 240
LDI r12, 493
LDI r13, 18
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
