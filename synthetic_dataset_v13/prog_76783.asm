; DESCRIPTION: Composite: Creates a magenta rectangular region at (229, 171) spanning 74 by 24 pixels then Places a cyan dot at position (343, 2) then Renders a blue disk with center (460, 74) and radius 10.
; PLAN: r0=229(x), r1=171(y), r2=74(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=343(x), r6=2(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=460(x), r11=74(y), r12=10(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 229
LDI r1, 171
LDI r2, 74
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 2
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 460
LDI r11, 74
LDI r12, 10
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
