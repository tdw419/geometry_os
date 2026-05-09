; DESCRIPTION: Composite: Places a red line segment connecting (115, 154) to (317, 115) then Creates a magenta circular shape at (377, 66) with radius 36 then Places a white 54x116 rectangle at position (31, 91).
; PLAN: r0=115(x1), r1=154(y1), r2=317(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=66(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=31(x), r11=91(y), r12=54(width), r13=116(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 154
LDI r2, 317
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 66
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 31
LDI r11, 91
LDI r12, 54
LDI r13, 116
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
