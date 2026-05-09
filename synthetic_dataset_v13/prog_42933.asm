; DESCRIPTION: Composite: Draws a black line from (405, 37) to (96, 211) then Renders a yellow disk with center (258, 194) and radius 12 then Draws a cyan rectangle at (206, 130) with width 49 and height 97.
; PLAN: r0=405(x1), r1=37(y1), r2=96(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=194(y), r7=12(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=206(x), r11=130(y), r12=49(width), r13=97(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 37
LDI r2, 96
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 194
LDI r7, 12
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 206
LDI r11, 130
LDI r12, 49
LDI r13, 97
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
