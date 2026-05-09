; DESCRIPTION: Composite: Places a magenta dot at position (367, 174) then Renders a red box of size 44x74 starting at (179, 155) then Renders a white disk with center (97, 155) and radius 55.
; PLAN: r0=367(x), r1=174(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=179(x), r6=155(y), r7=44(width), r8=74(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=97(x), r11=155(y), r12=55(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 367
LDI r1, 174
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 179
LDI r6, 155
LDI r7, 44
LDI r8, 74
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 155
LDI r12, 55
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
