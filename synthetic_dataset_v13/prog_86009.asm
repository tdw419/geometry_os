; DESCRIPTION: Composite: Creates a white circular shape at (344, 160) with radius 75 then Renders a black box of size 35x34 starting at (206, 191) then Places a green dot at position (57, 35).
; PLAN: r0=344(x), r1=160(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x), r6=191(y), r7=35(width), r8=34(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=57(x), r11=35(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 344
LDI r1, 160
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 191
LDI r7, 35
LDI r8, 34
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 35
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
