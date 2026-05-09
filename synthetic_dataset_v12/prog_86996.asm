; DESCRIPTION: Composite: Renders a red disk with center (196, 180) and radius 40 then Places a magenta dot at position (348, 153) then Creates a red rectangular region at (181, 59) spanning 77 by 23 pixels.
; PLAN: r0=196(x), r1=180(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=153(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=181(x), r11=59(y), r12=77(width), r13=23(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 180
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 153
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 181
LDI r11, 59
LDI r12, 77
LDI r13, 23
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
