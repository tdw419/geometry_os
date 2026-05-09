; DESCRIPTION: Composite: Places a green 43x57 rectangle at position (170, 32) then Creates a white circular shape at (277, 80) with radius 10 then Sets a single white pixel at (400, 13).
; PLAN: r0=170(x), r1=32(y), r2=43(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x), r6=80(y), r7=10(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=400(x), r11=13(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 170
LDI r1, 32
LDI r2, 43
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 80
LDI r7, 10
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 400
LDI r11, 13
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
