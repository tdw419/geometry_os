; DESCRIPTION: Composite: Places a green dot at position (350, 150) then Renders a blue disk with center (44, 104) and radius 18 then Renders a red box of size 102x100 starting at (200, 106).
; PLAN: r0=350(x), r1=150(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=44(x), r6=104(y), r7=18(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=200(x), r11=106(y), r12=102(width), r13=100(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 150
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 44
LDI r6, 104
LDI r7, 18
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 200
LDI r11, 106
LDI r12, 102
LDI r13, 100
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
