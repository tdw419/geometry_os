; DESCRIPTION: Composite: Places a orange dot at position (350, 130) then Renders a yellow box of size 68x100 starting at (103, 98) then Renders a purple disk with center (374, 155) and radius 75.
; PLAN: r0=350(x), r1=130(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=103(x), r6=98(y), r7=68(width), r8=100(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=374(x), r11=155(y), r12=75(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 350
LDI r1, 130
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 103
LDI r6, 98
LDI r7, 68
LDI r8, 100
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 155
LDI r12, 75
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
