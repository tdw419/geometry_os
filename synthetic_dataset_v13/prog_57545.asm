; DESCRIPTION: Composite: Draws a black line from (412, 52) to (429, 235) then Renders a magenta box of size 64x64 starting at (168, 90) then Renders a green disk with center (332, 101) and radius 73.
; PLAN: r0=412(x1), r1=52(y1), r2=429(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=90(y), r7=64(width), r8=64(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=332(x), r11=101(y), r12=73(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 412
LDI r1, 52
LDI r2, 429
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 90
LDI r7, 64
LDI r8, 64
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 101
LDI r12, 73
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
