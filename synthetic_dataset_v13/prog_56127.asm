; DESCRIPTION: Composite: Renders a green box of size 85x70 starting at (401, 1) then Places a red dot at position (49, 220) then Places a red circle of radius 13 at center (131, 227).
; PLAN: r0=401(x), r1=1(y), r2=85(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x), r6=220(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=131(x), r11=227(y), r12=13(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 401
LDI r1, 1
LDI r2, 85
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 220
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 131
LDI r11, 227
LDI r12, 13
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
