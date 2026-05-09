; DESCRIPTION: Composite: Draws a magenta line from (5, 177) to (176, 1) then Renders a red disk with center (401, 188) and radius 35 then Renders a white box of size 36x71 starting at (156, 127).
; PLAN: r0=5(x1), r1=177(y1), r2=176(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=401(x), r6=188(y), r7=35(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=156(x), r11=127(y), r12=36(width), r13=71(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 5
LDI r1, 177
LDI r2, 176
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 188
LDI r7, 35
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 156
LDI r11, 127
LDI r12, 36
LDI r13, 71
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
