; DESCRIPTION: Composite: Renders a red box of size 106x76 starting at (215, 119) then Creates a red circular shape at (149, 60) with radius 57 then Draws a magenta line from (384, 247) to (328, 166).
; PLAN: r0=215(x), r1=119(y), r2=106(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x), r6=60(y), r7=57(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=384(x1), r11=247(y1), r12=328(x2), r13=166(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 215
LDI r1, 119
LDI r2, 106
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 60
LDI r7, 57
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 384
LDI r11, 247
LDI r12, 328
LDI r13, 166
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
