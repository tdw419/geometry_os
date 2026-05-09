; DESCRIPTION: Composite: Renders a orange box of size 17x37 starting at (350, 161) then Sets a single green pixel at (330, 117) then Places a magenta line segment connecting (361, 76) to (4, 184).
; PLAN: r0=350(x), r1=161(y), r2=17(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x), r6=117(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=361(x1), r11=76(y1), r12=4(x2), r13=184(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 161
LDI r2, 17
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 117
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 361
LDI r11, 76
LDI r12, 4
LDI r13, 184
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
