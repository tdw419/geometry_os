; DESCRIPTION: Composite: Places a white line segment connecting (252, 220) to (255, 43) then Renders a magenta disk with center (189, 83) and radius 66 then Creates a cyan rectangular region at (117, 120) spanning 34 by 42 pixels.
; PLAN: r0=252(x1), r1=220(y1), r2=255(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=83(y), r7=66(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=117(x), r11=120(y), r12=34(width), r13=42(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 220
LDI r2, 255
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 83
LDI r7, 66
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 117
LDI r11, 120
LDI r12, 34
LDI r13, 42
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
