; DESCRIPTION: Composite: Renders a magenta box of size 37x28 starting at (290, 55) then Renders a orange line between points (487, 207) and (142, 221) then Renders a yellow disk with center (204, 130) and radius 21.
; PLAN: r0=290(x), r1=55(y), r2=37(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=487(x1), r6=207(y1), r7=142(x2), r8=221(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=204(x), r11=130(y), r12=21(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 55
LDI r2, 37
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 207
LDI r7, 142
LDI r8, 221
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 204
LDI r11, 130
LDI r12, 21
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
