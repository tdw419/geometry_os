; DESCRIPTION: Composite: Renders a orange box of size 77x99 starting at (377, 126) then Renders a cyan disk with center (46, 217) and radius 32 then Places a black line segment connecting (460, 32) to (422, 63).
; PLAN: r0=377(x), r1=126(y), r2=77(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=46(x), r6=217(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=460(x1), r11=32(y1), r12=422(x2), r13=63(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 126
LDI r2, 77
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 217
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 460
LDI r11, 32
LDI r12, 422
LDI r13, 63
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
