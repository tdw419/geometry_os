; DESCRIPTION: Composite: Draws a cyan circle centered at (398, 141) with radius 48 then Places a cyan 78x15 rectangle at position (321, 165) then Renders a magenta line between points (202, 3) and (56, 128).
; PLAN: r0=398(x), r1=141(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x), r6=165(y), r7=78(width), r8=15(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=202(x1), r11=3(y1), r12=56(x2), r13=128(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 398
LDI r1, 141
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 165
LDI r7, 78
LDI r8, 15
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 3
LDI r12, 56
LDI r13, 128
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
