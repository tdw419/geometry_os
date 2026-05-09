; DESCRIPTION: Composite: Places a orange line segment connecting (401, 99) to (387, 197) then Places a white dot at position (504, 63) then Places a black circle of radius 40 at center (214, 188).
; PLAN: r0=401(x1), r1=99(y1), r2=387(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=504(x), r6=63(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=214(x), r11=188(y), r12=40(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 401
LDI r1, 99
LDI r2, 387
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 63
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 214
LDI r11, 188
LDI r12, 40
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
