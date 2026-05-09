; DESCRIPTION: Composite: Places a red 114x17 rectangle at position (242, 33) then Places a orange dot at position (392, 34) then Places a purple circle of radius 48 at center (284, 178).
; PLAN: r0=242(x), r1=33(y), r2=114(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=392(x), r6=34(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=284(x), r11=178(y), r12=48(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 242
LDI r1, 33
LDI r2, 114
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 34
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 284
LDI r11, 178
LDI r12, 48
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
