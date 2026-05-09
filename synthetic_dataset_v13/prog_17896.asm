; DESCRIPTION: Composite: Renders a white line between points (369, 210) and (0, 53) then Places a blue circle of radius 63 at center (410, 113) then Draws a black rectangle at (245, 98) with width 21 and height 27.
; PLAN: r0=369(x1), r1=210(y1), r2=0(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=113(y), r7=63(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=245(x), r11=98(y), r12=21(width), r13=27(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 210
LDI r2, 0
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 113
LDI r7, 63
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 245
LDI r11, 98
LDI r12, 21
LDI r13, 27
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
