; DESCRIPTION: Composite: Draws a white circle centered at (209, 121) with radius 64 then Draws a orange line from (271, 242) to (303, 45) then Creates a blue rectangular region at (210, 51) spanning 115 by 87 pixels.
; PLAN: r0=209(x), r1=121(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=271(x1), r6=242(y1), r7=303(x2), r8=45(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=210(x), r11=51(y), r12=115(width), r13=87(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 121
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 271
LDI r6, 242
LDI r7, 303
LDI r8, 45
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 51
LDI r12, 115
LDI r13, 87
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
