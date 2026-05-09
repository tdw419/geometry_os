; DESCRIPTION: Composite: Renders a white disk with center (300, 202) and radius 32 then Sets a single magenta pixel at (393, 249) then Creates a orange rectangular region at (161, 13) spanning 57 by 117 pixels.
; PLAN: r0=300(x), r1=202(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x), r6=249(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=161(x), r11=13(y), r12=57(width), r13=117(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 202
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 249
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 161
LDI r11, 13
LDI r12, 57
LDI r13, 117
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
