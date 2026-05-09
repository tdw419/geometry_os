; DESCRIPTION: Composite: Draws a black rectangle at (83, 18) with width 76 and height 69 then Renders a magenta line between points (263, 39) and (354, 173) then Draws a cyan circle centered at (247, 117) with radius 66.
; PLAN: r0=83(x), r1=18(y), r2=76(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x1), r6=39(y1), r7=354(x2), r8=173(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=247(x), r11=117(y), r12=66(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 83
LDI r1, 18
LDI r2, 76
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 39
LDI r7, 354
LDI r8, 173
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 117
LDI r12, 66
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
