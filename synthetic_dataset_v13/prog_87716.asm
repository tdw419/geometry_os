; DESCRIPTION: Composite: Draws a black rectangle at (39, 189) with width 21 and height 33 then Sets a single orange pixel at (480, 129) then Places a white circle of radius 80 at center (184, 113).
; PLAN: r0=39(x), r1=189(y), r2=21(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=480(x), r6=129(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=184(x), r11=113(y), r12=80(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 39
LDI r1, 189
LDI r2, 21
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 129
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 184
LDI r11, 113
LDI r12, 80
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
