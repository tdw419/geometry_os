; DESCRIPTION: Composite: Renders a blue disk with center (327, 226) and radius 21 then Renders a blue box of size 55x65 starting at (151, 49) then Sets a single magenta pixel at (22, 165).
; PLAN: r0=327(x), r1=226(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=49(y), r7=55(width), r8=65(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=22(x), r11=165(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 327
LDI r1, 226
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 49
LDI r7, 55
LDI r8, 65
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 22
LDI r11, 165
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
