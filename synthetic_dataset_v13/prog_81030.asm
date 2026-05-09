; DESCRIPTION: Composite: Places a magenta 28x68 rectangle at position (95, 1) then Places a orange dot at position (182, 217) then Renders a magenta disk with center (234, 166) and radius 71.
; PLAN: r0=95(x), r1=1(y), r2=28(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x), r6=217(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=234(x), r11=166(y), r12=71(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 95
LDI r1, 1
LDI r2, 28
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 217
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 234
LDI r11, 166
LDI r12, 71
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
