; DESCRIPTION: Composite: Renders a blue disk with center (333, 81) and radius 65 then Sets a single magenta pixel at (417, 171) then Renders a orange box of size 58x72 starting at (15, 180).
; PLAN: r0=333(x), r1=81(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=417(x), r6=171(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=15(x), r11=180(y), r12=58(width), r13=72(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 333
LDI r1, 81
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 417
LDI r6, 171
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 15
LDI r11, 180
LDI r12, 58
LDI r13, 72
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
