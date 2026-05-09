; DESCRIPTION: Composite: Creates a black rectangular region at (329, 186) spanning 110 by 20 pixels then Places a orange dot at position (46, 207) then Places a cyan circle of radius 60 at center (92, 163).
; PLAN: r0=329(x), r1=186(y), r2=110(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=46(x), r6=207(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=92(x), r11=163(y), r12=60(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 329
LDI r1, 186
LDI r2, 110
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 207
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 92
LDI r11, 163
LDI r12, 60
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
