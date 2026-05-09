; DESCRIPTION: Composite: Draws a white line from (57, 79) to (285, 242) then Draws a black circle centered at (136, 115) with radius 32 then Places a magenta 16x55 rectangle at position (168, 0).
; PLAN: r0=57(x1), r1=79(y1), r2=285(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=136(x), r6=115(y), r7=32(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=168(x), r11=0(y), r12=16(width), r13=55(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 79
LDI r2, 285
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 115
LDI r7, 32
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 168
LDI r11, 0
LDI r12, 16
LDI r13, 55
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
