; DESCRIPTION: Composite: Renders a yellow disk with center (440, 194) and radius 39 then Creates a yellow rectangular region at (362, 109) spanning 23 by 19 pixels.
; PLAN: r0=440(x), r1=194(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=362(x), r6=109(y), r7=23(width), r8=19(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 194
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 362
LDI r6, 109
LDI r7, 23
LDI r8, 19
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
