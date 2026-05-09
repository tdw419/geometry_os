; DESCRIPTION: Composite: Places a magenta dot at position (452, 146) then Creates a blue rectangular region at (69, 59) spanning 100 by 19 pixels then Places a green circle of radius 48 at center (52, 206).
; PLAN: r0=452(x), r1=146(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=69(x), r6=59(y), r7=100(width), r8=19(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=52(x), r11=206(y), r12=48(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 452
LDI r1, 146
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 69
LDI r6, 59
LDI r7, 100
LDI r8, 19
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 52
LDI r11, 206
LDI r12, 48
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
