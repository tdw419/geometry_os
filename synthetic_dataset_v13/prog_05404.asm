; DESCRIPTION: Composite: Creates a purple rectangular region at (375, 19) spanning 102 by 117 pixels then Places a orange dot at position (336, 249) then Renders a green line between points (102, 110) and (214, 242).
; PLAN: r0=375(x), r1=19(y), r2=102(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x), r6=249(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=102(x1), r11=110(y1), r12=214(x2), r13=242(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 375
LDI r1, 19
LDI r2, 102
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 249
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 102
LDI r11, 110
LDI r12, 214
LDI r13, 242
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
