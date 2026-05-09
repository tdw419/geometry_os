; DESCRIPTION: Composite: Renders a orange disk with center (213, 141) and radius 75 then Sets a single yellow pixel at (51, 87) then Renders a black box of size 113x86 starting at (357, 63).
; PLAN: r0=213(x), r1=141(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=51(x), r6=87(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=357(x), r11=63(y), r12=113(width), r13=86(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 141
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 51
LDI r6, 87
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 357
LDI r11, 63
LDI r12, 113
LDI r13, 86
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
