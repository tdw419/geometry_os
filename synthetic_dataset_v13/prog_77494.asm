; DESCRIPTION: Composite: Draws a magenta rectangle at (303, 152) with width 29 and height 58 then Places a red line segment connecting (45, 201) to (29, 64) then Renders a cyan disk with center (326, 128) and radius 66.
; PLAN: r0=303(x), r1=152(y), r2=29(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x1), r6=201(y1), r7=29(x2), r8=64(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=326(x), r11=128(y), r12=66(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 303
LDI r1, 152
LDI r2, 29
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 201
LDI r7, 29
LDI r8, 64
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 128
LDI r12, 66
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
