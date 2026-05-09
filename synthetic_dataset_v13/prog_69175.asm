; DESCRIPTION: Composite: Sets a single orange pixel at (15, 208) then Places a white line segment connecting (333, 133) to (372, 165) then Creates a cyan rectangular region at (340, 10) spanning 77 by 53 pixels.
; PLAN: r0=15(x), r1=208(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=333(x1), r6=133(y1), r7=372(x2), r8=165(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=340(x), r11=10(y), r12=77(width), r13=53(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 15
LDI r1, 208
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 333
LDI r6, 133
LDI r7, 372
LDI r8, 165
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 10
LDI r12, 77
LDI r13, 53
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
