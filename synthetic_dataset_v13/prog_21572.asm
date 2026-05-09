; DESCRIPTION: Composite: Renders a yellow disk with center (275, 178) and radius 67 then Renders a cyan box of size 44x88 starting at (367, 78) then Draws a white line from (434, 85) to (426, 1).
; PLAN: r0=275(x), r1=178(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x), r6=78(y), r7=44(width), r8=88(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=434(x1), r11=85(y1), r12=426(x2), r13=1(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 178
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 78
LDI r7, 44
LDI r8, 88
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 85
LDI r12, 426
LDI r13, 1
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
