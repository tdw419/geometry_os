; DESCRIPTION: Composite: Creates a cyan circular shape at (279, 173) with radius 42 then Places a purple line segment connecting (393, 146) to (402, 164) then Draws a green rectangle at (387, 117) with width 92 and height 101.
; PLAN: r0=279(x), r1=173(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x1), r6=146(y1), r7=402(x2), r8=164(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=387(x), r11=117(y), r12=92(width), r13=101(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 173
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 146
LDI r7, 402
LDI r8, 164
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 387
LDI r11, 117
LDI r12, 92
LDI r13, 101
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
