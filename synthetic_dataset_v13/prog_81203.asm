; DESCRIPTION: Composite: Draws a green line from (321, 98) to (174, 100) then Draws a cyan circle centered at (119, 89) with radius 20 then Draws a yellow rectangle at (435, 58) with width 27 and height 92.
; PLAN: r0=321(x1), r1=98(y1), r2=174(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=89(y), r7=20(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=435(x), r11=58(y), r12=27(width), r13=92(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 98
LDI r2, 174
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 89
LDI r7, 20
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 435
LDI r11, 58
LDI r12, 27
LDI r13, 92
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
