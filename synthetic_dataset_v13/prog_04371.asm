; DESCRIPTION: Composite: Renders a orange box of size 40x119 starting at (169, 27) then Sets a single purple pixel at (407, 63) then Places a green line segment connecting (164, 233) to (371, 250).
; PLAN: r0=169(x), r1=27(y), r2=40(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x), r6=63(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=164(x1), r11=233(y1), r12=371(x2), r13=250(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 169
LDI r1, 27
LDI r2, 40
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 63
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 164
LDI r11, 233
LDI r12, 371
LDI r13, 250
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
