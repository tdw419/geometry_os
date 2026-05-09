; DESCRIPTION: Composite: Places a white dot at position (53, 21) then Draws a white circle centered at (123, 209) with radius 14 then Draws a cyan line from (188, 240) to (224, 255).
; PLAN: r0=53(x), r1=21(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=123(x), r6=209(y), r7=14(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=188(x1), r11=240(y1), r12=224(x2), r13=255(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 53
LDI r1, 21
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 123
LDI r6, 209
LDI r7, 14
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 188
LDI r11, 240
LDI r12, 224
LDI r13, 255
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
