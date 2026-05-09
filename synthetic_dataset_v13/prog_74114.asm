; DESCRIPTION: Composite: Draws a red line from (183, 246) to (249, 0) then Renders a magenta box of size 70x65 starting at (413, 149) then Draws a cyan circle centered at (333, 153) with radius 69.
; PLAN: r0=183(x1), r1=246(y1), r2=249(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=149(y), r7=70(width), r8=65(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=333(x), r11=153(y), r12=69(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 183
LDI r1, 246
LDI r2, 249
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 149
LDI r7, 70
LDI r8, 65
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 153
LDI r12, 69
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
