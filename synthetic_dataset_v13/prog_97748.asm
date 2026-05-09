; DESCRIPTION: Composite: Renders a white disk with center (251, 23) and radius 19 then Draws a black line from (403, 185) to (213, 69) then Renders a cyan box of size 106x88 starting at (155, 5).
; PLAN: r0=251(x), r1=23(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x1), r6=185(y1), r7=213(x2), r8=69(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=155(x), r11=5(y), r12=106(width), r13=88(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 23
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 185
LDI r7, 213
LDI r8, 69
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 5
LDI r12, 106
LDI r13, 88
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
