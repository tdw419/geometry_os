; DESCRIPTION: Composite: Renders a green box of size 105x72 starting at (13, 0) then Places a magenta circle of radius 45 at center (273, 170) then Renders a green line between points (462, 47) and (41, 11).
; PLAN: r0=13(x), r1=0(y), r2=105(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=273(x), r6=170(y), r7=45(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=462(x1), r11=47(y1), r12=41(x2), r13=11(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 0
LDI r2, 105
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 170
LDI r7, 45
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 462
LDI r11, 47
LDI r12, 41
LDI r13, 11
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
