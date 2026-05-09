; DESCRIPTION: Composite: Places a yellow circle of radius 79 at center (123, 91) then Renders a green box of size 84x39 starting at (134, 17).
; PLAN: r0=123(x), r1=91(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x), r6=17(y), r7=84(width), r8=39(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 123
LDI r1, 91
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 17
LDI r7, 84
LDI r8, 39
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
