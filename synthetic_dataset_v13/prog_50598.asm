; DESCRIPTION: Composite: Creates a magenta circular shape at (329, 132) with radius 60 then Sets a single red pixel at (240, 217) then Renders a purple box of size 14x112 starting at (406, 76).
; PLAN: r0=329(x), r1=132(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x), r6=217(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=406(x), r11=76(y), r12=14(width), r13=112(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 132
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 217
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 406
LDI r11, 76
LDI r12, 14
LDI r13, 112
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
