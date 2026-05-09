; DESCRIPTION: Composite: Draws a white rectangle at (248, 120) with width 36 and height 99 then Creates a cyan circular shape at (83, 81) with radius 68 then Draws a cyan line from (161, 18) to (16, 48).
; PLAN: r0=248(x), r1=120(y), r2=36(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x), r6=81(y), r7=68(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=161(x1), r11=18(y1), r12=16(x2), r13=48(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 120
LDI r2, 36
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 81
LDI r7, 68
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 161
LDI r11, 18
LDI r12, 16
LDI r13, 48
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
