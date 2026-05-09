; DESCRIPTION: Composite: Renders a orange box of size 79x60 starting at (171, 132) then Places a purple dot at position (334, 102) then Places a green line segment connecting (357, 237) to (384, 21).
; PLAN: r0=171(x), r1=132(y), r2=79(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=334(x), r6=102(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=357(x1), r11=237(y1), r12=384(x2), r13=21(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 132
LDI r2, 79
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 102
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 357
LDI r11, 237
LDI r12, 384
LDI r13, 21
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
