; DESCRIPTION: Composite: Renders a yellow box of size 37x61 starting at (116, 57) then Places a magenta line segment connecting (280, 149) to (61, 228) then Draws a orange circle centered at (214, 238) with radius 11.
; PLAN: r0=116(x), r1=57(y), r2=37(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x1), r6=149(y1), r7=61(x2), r8=228(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=214(x), r11=238(y), r12=11(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 116
LDI r1, 57
LDI r2, 37
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 149
LDI r7, 61
LDI r8, 228
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 238
LDI r12, 11
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
